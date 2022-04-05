//
//  ViewController.swift
//  API_Test
//
//  Created by Mariano Uriel Delgado on 05/04/2022.
//

import UIKit

class ViewController: UIViewController {

    var datos : [Photo] = []
    
    @IBOutlet weak var tableView: UITableView!
    var fotoSeleccionada : Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
        
        self.getFotos()
    }
    func getFotos(){
        APIManager.shared.getPhotos { (fotos, mensaje) in
            if(mensaje != nil){
                print(mensaje)
            }else if ((fotos?.count ?? 0) > 0){
                self.datos = fotos ?? []
                self.tableView.reloadData()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detalle"){
            let vc = segue.destination as! DetailViewViewController
            vc.foto = self.fotoSeleccionada
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let foto = self.datos[indexPath.row]
        cell.idLabel.text = String(foto.getId())
        cell.titleLabel.text = foto.getTitle()
        //cell.imagen.load(url: foto.getThumbnailUrl()!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.fotoSeleccionada = self.datos[indexPath.row]
        self.performSegue(withIdentifier: "detalle", sender: self)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
extension UIImageView {
    func load(url: URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


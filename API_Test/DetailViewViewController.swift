//
//  DetailViewViewController.swift
//  API_Test
//
//  Created by Mariano Uriel Delgado on 05/04/2022.
//

import UIKit

class DetailViewViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var foto : Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idLabel.text = String( self.foto.getId())
        self.titleLabel.text = self.foto.getTitle()
        self.imageView.load(url: self.foto.getUrl()!)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

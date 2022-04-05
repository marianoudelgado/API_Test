//
//  TableViewCell.swift
//  API_Test
//
//  Created by Mariano Uriel Delgado on 05/04/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.card.clipsToBounds = true
        self.card.layer.cornerRadius = 12
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

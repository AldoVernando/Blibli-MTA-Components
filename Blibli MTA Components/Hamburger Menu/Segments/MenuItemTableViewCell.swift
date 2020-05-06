//
//  MenuItemTableViewCell.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/6/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {

    @IBOutlet weak var menuItemImage: UIImageView!
    @IBOutlet weak var menuItemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        menuItemImage.layer.cornerRadius = menuItemImage.frame.height / 2
    }

}

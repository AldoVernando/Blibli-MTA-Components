//
//  OrderTableViewCell.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/11/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var orderTitle: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var orderDescription: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  ChipCollectionViewCell.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/12/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class ChipCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var chipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = bounds.height / 2
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        
    }

}

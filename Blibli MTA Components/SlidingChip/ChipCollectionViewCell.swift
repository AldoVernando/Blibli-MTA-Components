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
    
    
    // chip diselect
    func setColorWhite() {
        UIView.animate(withDuration: 0.3) {
            self.backgroundColor = .white
            self.chipLabel.textColor = #colorLiteral(red: 0.1575623453, green: 0.6193835735, blue: 0.870402813, alpha: 1)
        }
    }
    
    // chip selet
    func setColorBlue() {
        UIView.animate(withDuration: 0.3) {
            self.backgroundColor = #colorLiteral(red: 0.1268230677, green: 0.5874770284, blue: 0.8762937188, alpha: 1)
            self.chipLabel.textColor = .white
        }
    }

}

//
//  BlibliLabel.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/15/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class BlibliLabel: UIView {

    let bliLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "label"
        label.textRect(forBounds: CGRect(x: 0, y: 0, width: 100, height: 30), limitedToNumberOfLines: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        
        frame = CGRect(x: 0, y: 0, width: 200, height: 21)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bliLabel)
        
        NSLayoutConstraint.activate([
            
            bliLabel.topAnchor.constraint(equalTo: topAnchor),
            bliLabel.leftAnchor.constraint(equalTo: leftAnchor),
            bliLabel.rightAnchor.constraint(equalTo: rightAnchor),
            bliLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        layer.cornerRadius = frame.height / 2
        backgroundColor = #colorLiteral(red: 0.1268230677, green: 0.5874770284, blue: 0.8762937188, alpha: 1)
    
    }

}

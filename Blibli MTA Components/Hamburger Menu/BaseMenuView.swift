//
//  BaseMenuView.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/6/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class BaseMenuView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var midView: MenuContainerView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    
    func setUp() {
        Bundle.main.loadNibNamed("BaseMenuView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 50, height: stackView.frame.height + 60)
        contentView.roundCorners(corners: [.topRight, .bottomRight], radius: 5)
        
    }
    
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}


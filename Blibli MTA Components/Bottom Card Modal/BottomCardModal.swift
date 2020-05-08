//
//  BottomCardModal.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/8/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import Foundation
import UIKit

class BottomCardModal {
    
    static let instance = BottomCardModal()
    
    func show(owner: UIViewController) {
        let vc = BottomViewController()
        
        let renderer = UIGraphicsImageRenderer(size: owner.view.bounds.size)
        
        vc.backgroundImage = renderer.image { rendererContext in
            owner.view.drawHierarchy(in: owner.view.bounds, afterScreenUpdates: true)
        }
            
        vc.modalPresentationStyle = .fullScreen
        
        owner.present(vc, animated: false, completion: nil)
    }
    
}

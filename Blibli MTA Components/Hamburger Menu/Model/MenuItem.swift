//
//  MenuItem.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/6/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import Foundation
import UIKit

class MenuItem {
    
    var name: String?
    var image: UIImage?
    var destination: UIViewController?
    
    init(name: String?, image: UIImage?, destination: UIViewController?) {
        self.name = name ?? ""
        self.image = image ?? UIImage(systemName: "ant")
        self.destination = destination ?? UIViewController()
    }
    
    func clicked() {
        print("clicked")
    }
    
}

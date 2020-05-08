//
//  ViewController.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/6/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hamburgerMenu: UIView!
    @IBOutlet weak var menuConstraint: NSLayoutConstraint!
    var menuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hamburgerMenu.addSubview(BaseMenuView())
        hamburgerMenu.translatesAutoresizingMaskIntoConstraints = false
        
    }

    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        
        if menuOpen {
            menuConstraint.constant = -500
            menuOpen = false
        } else {
            menuConstraint.constant = 0
            menuOpen = true
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func alertTapped(_ sender: Any) {
        CustomAlertView.instance.showAlert(type: .success, title: "Success change password", message: "Your password for this account already changed", buttonLabel: "Okay, got it", parent: self)
    }
    
    @IBAction func showModalBtnTapped(_ sender: UIButton) {
        BottomCardModal.instance.show(owner: self)
    }
    
}


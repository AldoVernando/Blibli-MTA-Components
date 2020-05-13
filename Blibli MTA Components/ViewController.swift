//
//  ViewController.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/6/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var menuOpen = false
    var menuConstraint: NSLayoutConstraint!
    
    let hamburgerMenu: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabs = TabSlide()
        tabs.setData(data: ["General", "News & Updates"])
        
        let chips = ChipSlide()
        chips.setData(data: ["Order", "Product Q & A", "Product"])
        
        view.addSubview(chips)
        view.addSubview(tabs)
        
        view.addSubview(hamburgerMenu)
        hamburgerMenu.addSubview(BaseMenuView())
        
        NSLayoutConstraint.activate([
            
            tabs.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tabs.rightAnchor.constraint(equalTo: view.rightAnchor),
            tabs.leftAnchor.constraint(equalTo: view.leftAnchor),
            tabs.heightAnchor.constraint(equalToConstant: 60),
            
            chips.topAnchor.constraint(equalTo: tabs.bottomAnchor),
            chips.leftAnchor.constraint(equalTo: view.leftAnchor),
            chips.rightAnchor.constraint(equalTo: view.rightAnchor),
            chips.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        menuConstraint = NSLayoutConstraint(item: hamburgerMenu, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: -500)
        
        menuConstraint.isActive = true
       
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

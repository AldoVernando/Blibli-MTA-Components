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
    
//    let hamburgerMenu: UIView = {
//        let view = UIView()
//        view.autoresizesSubviews = true
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        return view
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let hamburgerMenu = BaseMenuView()
        
        view.addSubview(hamburgerMenu)
//        hamburgerMenu.addSubview(baseMenu)
        
        NSLayoutConstraint.activate([
            
            hamburgerMenu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hamburgerMenu.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
        navigationController?.pushViewController(NotificationViewController(), animated: true)
    }
    
    @IBAction func showModalBtnTapped(_ sender: UIButton) {
        BottomCardModal.instance.show(owner: self)
    }
    
    
    
    @IBAction func infoAlertTapped(_ sender: UIButton) {
        CustomAlert.instance.showAlert(type: .information, title: "Information", message: "Your password for this account already changed", buttonLabel: "Okay, got it", parent: self)
    }
    
    @IBAction func showAlertTaped(_ sender: UIButton) {
        CustomAlert.instance.showAlert(type: .alert, title: "Alert", message: "Your password for this account already changed", buttonLabel: "Okay, got it", parent: self)
    }
    
    @IBAction func errorAlertTapped(_ sender: UIButton) {
        CustomAlert.instance.showAlert(type: .error, title: "Error", message: "Your password for this account already changed", buttonLabel: "Okay, got it", parent: self)
    }
    
    @IBAction func successAlertTapped(_ sender: UIButton) {
        CustomAlert.instance.showAlert(type: .success, title: "Success change password", message: "Your password for this account already changed", buttonLabel: "Okay, got it", parent: self)
    }
    
    
    
}

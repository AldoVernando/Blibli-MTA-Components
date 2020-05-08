//
//  CustomAlertView.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/6/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class CustomAlertView: UIView {

    static let instance = CustomAlertView()
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertMessage: UILabel!
    @IBOutlet weak var alertBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    @IBAction func alertBtnTapped(_ sender: UIButton) {
        animateOut()
    }
    
    func setUp() {
        Bundle.main.loadNibNamed("CustomAlertView", owner: self, options: nil)
       
        contentView.layer.cornerRadius = 5
        alertImage.layer.cornerRadius = alertImage.frame.height / 2
        alertBtn.layer.cornerRadius = 5
    }

    
    enum AlertType {
        case success
        case failure
    }
    
    
    func showAlert(type: AlertType, title: String, message: String, buttonLabel: String?, parent: UIViewController) {
        
        switch  type {
        case .success:
            alertImage.image = UIImage(systemName: "checkmark.circle")
            alertImage.backgroundColor = #colorLiteral(red: 0.3738499238, green: 0.9821938452, blue: 0.250151446, alpha: 1)
        case .failure:
            alertImage.image = UIImage(systemName: "xmark.circle")
            alertImage.backgroundColor = .systemRed
        }
        
        alertTitle.text = title
        alertMessage.text = message
        
        if let title = buttonLabel {
            alertBtn.setTitle(title, for: .normal)
        }
        
        let textLines: Int = Int(alertMessage.frame.size.height / 20)
        
        contentView.frame.size.height = 240 + CGFloat((textLines * 20))
        
        UIApplication.shared.keyWindow?.addSubview(contentView)
        
        contentView.center = parent.view.center
        animateIn()
    }
    
    func animateIn() {
        contentView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        contentView.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            self.contentView.alpha = 1
            self.contentView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.alpha = 0
            self.contentView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.contentView.removeFromSuperview()
        }
    }
    
}

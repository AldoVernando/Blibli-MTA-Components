//
//  CustomAlertView.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/6/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class CustomAlert: UIView {

    static let instance = CustomAlert()
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertMessage: UILabel!
    @IBOutlet weak var alertBtn: UIButton!
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.alpha = 0.5
        view.frame.size.height = UIScreen.main.bounds.height
        view.frame.size.width = UIScreen.main.bounds.width
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
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
        alertBtn.layer.cornerRadius = 5
    }

    
    enum AlertType {
        case information
        case alert
        case success
        case error
    }
    
    
    func showAlert(type: AlertType, title: String, message: String, buttonLabel: String?, parent: UIViewController) {
        
        switch  type {
            case .information:
                alertImage.image = UIImage(systemName: "info.circle.fill")
                alertImage.tintColor = #colorLiteral(red: 0.1268230677, green: 0.5874770284, blue: 0.8762937188, alpha: 1)
            case .alert:
                alertImage.image = UIImage(systemName: "exclamationmark.triangle.fill")
                alertImage.tintColor = #colorLiteral(red: 0.9693801999, green: 0.577829957, blue: 0.1156134978, alpha: 1)
            case .success:
                alertImage.image = UIImage(systemName: "checkmark.circle.fill")
                alertImage.tintColor = #colorLiteral(red: 0.6255576611, green: 0.8096942306, blue: 0.3772706985, alpha: 1)
            case .error:
                alertImage.image = UIImage(systemName: "xmark.circle.fill")
                alertImage.tintColor = .systemRed
        }
        
        alertTitle.text = title
        alertMessage.text = message
        
        if let title = buttonLabel {
            alertBtn.setTitle(title, for: .normal)
        }
        
        let textLines: Int = Int(alertMessage.frame.size.height / 20)
        
        animateIn()
        
        contentView.frame.size.height = 240 + CGFloat((textLines * 20))
        contentView.frame.size.width = UIScreen.main.bounds.width - 30
        
        
        UIApplication.shared.keyWindow?.addSubview(backgroundView)
        UIApplication.shared.keyWindow?.addSubview(contentView)
        
        contentView.center = parent.view.center
        
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
            self.backgroundView.removeFromSuperview()
        }
    }
    
}

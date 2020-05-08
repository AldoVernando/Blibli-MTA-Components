//
//  BottomViewController.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/8/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class BottomViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var dimmer: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var handleView: UIView!
    
    var backgroundImage: UIImage?

    enum CardViewState {
        case expanded
        case normal
    }

    var cardViewState : CardViewState = .normal

    var cardPanStartingTopConstant : CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleView.clipsToBounds = true
        handleView.layer.cornerRadius = 3
        
        cardView.clipsToBounds = true
        cardView.layer.cornerRadius = 10
        cardView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        background.image = backgroundImage
        
        let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height
        let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
            
        cardViewTopConstraint.constant = safeAreaHeight! + bottomPadding!
        
        dimmer.alpha = 0
        
        let dimmerTap = UITapGestureRecognizer(target: self, action: #selector(dimmerViewTapped(_:)))
        dimmer.addGestureRecognizer(dimmerTap)
        dimmer.isUserInteractionEnabled = true
        
        let viewPan = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))
        viewPan.delaysTouchesBegan = false
        viewPan.delaysTouchesEnded = false

        self.view.addGestureRecognizer(viewPan)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showCard(atState: .normal)
    }
    
    @objc func viewPanned(_ panRecognizer: UIPanGestureRecognizer) {
        let translation = panRecognizer.translation(in: self.view)
        let velocity = panRecognizer.velocity(in: self.view)
        
        switch panRecognizer.state {
        case .began:
          cardPanStartingTopConstant = cardViewTopConstraint.constant
        case .changed :
          if self.cardPanStartingTopConstant + translation.y > 30.0 {
              self.cardViewTopConstraint.constant = self.cardPanStartingTopConstant + translation.y
          }
            
          dimmer.alpha = dimAlphaWithCardTopConstraint(value: self.cardViewTopConstraint.constant)

        case .ended :
            
            if velocity.y > 1500.0 {
                hideCardAndGoBack()
                return
            }
            
            let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height
            let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
              
            if self.cardViewTopConstraint.constant < (safeAreaHeight! + bottomPadding!) * 0.25 {
                showCard(atState: .expanded)
            } else if self.cardViewTopConstraint.constant < (safeAreaHeight!) - 70 {
                showCard(atState: .normal)
            } else {
                // hide the card and dismiss current view controller
                hideCardAndGoBack()
            }
        default:
          break
        }

    }
    
    @objc func dimmerViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideCardAndGoBack()
    }

    
    private func showCard(atState: CardViewState = .normal) {
       
        self.view.layoutIfNeeded()
      
        let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height
        let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
        
        if atState == .expanded {
            cardViewTopConstraint.constant = 30.0
        } else {
            cardViewTopConstraint.constant = (safeAreaHeight! + bottomPadding!) / 2.0
        }
        cardPanStartingTopConstant = cardViewTopConstraint.constant
        
        let showCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })
      
        showCard.addAnimations({
            self.dimmer.alpha = 0.7
        })
      
        showCard.startAnimation()
    }

    
    private func hideCardAndGoBack() {
        
        self.view.layoutIfNeeded()
      
        let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height
        let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
        
        cardViewTopConstraint.constant = safeAreaHeight! + bottomPadding!
      
      
        let hideCard = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.view.layoutIfNeeded()
        })
      
        hideCard.addAnimations {
            self.dimmer.alpha = 0.0
        }
      
        hideCard.addCompletion({ position in
            if position == .end {
                if(self.presentingViewController != nil) {
                    self.dismiss(animated: false, completion: nil)
                }
            }
        })
      
        hideCard.startAnimation()
    }
    
    func dimAlphaWithCardTopConstraint(value: CGFloat) -> CGFloat {
        let fullDimAlpha : CGFloat = 0.7
      
        guard let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
        let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom else {
            return fullDimAlpha
        }
      
        let fullDimPosition = (safeAreaHeight + bottomPadding) / 2.0
        let noDimPosition = safeAreaHeight + bottomPadding
        
        if value < fullDimPosition {
            return fullDimAlpha
        }
      
        if value > noDimPosition {
            return 0.0
        }
      
      // else return an alpha value in between 0.0 and 0.7 based on the top constraint value
        return fullDimAlpha * 1 - ((value - fullDimPosition) / fullDimPosition)
    }

    
}

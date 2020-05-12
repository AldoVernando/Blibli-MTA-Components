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
    var chips: [String] = []
    var collectionView: UICollectionView!
    var selectedChip: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = ChipSlide().collectionView
        
        hamburgerMenu.addSubview(BaseMenuView())
        hamburgerMenu.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ChipCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "chipCell")
        chips = ["Order", "Product Q & A", "Product", "User", "Other"]
        collectionView.reloadData()
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chipCell", for: indexPath) as! ChipCollectionViewCell
        
        cell.chipLabel.text = chips[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ChipCollectionViewCell
        
        cell.backgroundColor = #colorLiteral(red: 0.1268230677, green: 0.5874770284, blue: 0.8762937188, alpha: 1)
        cell.chipLabel.textColor = .white
        
        if let chip = selectedChip {
            let selectedCell = collectionView.cellForItem(at: chip) as! ChipCollectionViewCell
            selectedCell.backgroundColor = .white
            selectedCell.chipLabel.textColor = #colorLiteral(red: 0.1575623453, green: 0.6193835735, blue: 0.870402813, alpha: 1)
        }
        
        selectedChip = indexPath
    }
}


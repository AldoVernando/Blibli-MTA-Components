//
//  ChipSlideView.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/13/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class ChipSlideView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 0, left: 15, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.autoresizesSubviews = true
        cv.clipsToBounds = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    var selectedChip: IndexPath?
    var chips: [String] = ["aaa","bbb"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    func setUp() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ChipCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "chipCell")
    }
    
    func setData(data: [String]) {
           chips.removeAll()
           chips.append(contentsOf: data)
           
           collectionView.reloadData()
    }
    
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
        cell.setColorBlue()
        
        if let chip = selectedChip {
            let selectedCell = collectionView.cellForItem(at: chip) as! ChipCollectionViewCell
            selectedCell.setColorWhite()
        }
        
        selectedChip = indexPath
    }

}

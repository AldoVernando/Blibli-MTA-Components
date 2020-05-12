//
//  ChipSlide.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/12/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class ChipSlide {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 5, left: 10, bottom: 5, right: 10)
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.autoresizesSubviews = true
        cv.clipsToBounds = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
}

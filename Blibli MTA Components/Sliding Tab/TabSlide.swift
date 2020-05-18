//
//  TabSlideView.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/13/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class TabSlide: UIView {

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.autoresizesSubviews = true
        cv.clipsToBounds = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    let outline: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.heightAnchor.constraint(equalToConstant: 3).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let inline: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 0, width: 100, height: 3))
        view.backgroundColor = #colorLiteral(red: 0.1268230677, green: 0.5874770284, blue: 0.8762937188, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var selectedTab: IndexPath?
    var items: [String] = []
    
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
        
        outline.addSubview(inline)
        
        stackView.addArrangedSubview(collectionView)
        stackView.addArrangedSubview(outline)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "TabItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tabCell")
    }
    
    func setData(data: [String]) {
        items.removeAll()
        items.append(contentsOf: data)
        
        collectionView.reloadData()
    }
    
}


// MARK: UICollectionView
extension TabSlide: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tabCell", for: indexPath) as! TabItemCollectionViewCell
        
        cell.itemLabel.text = items[indexPath.row]
        
        if indexPath.row == 0 {
            inline.frame = CGRect(x: cell.frame.minX, y: 0, width: cell.itemLabel.frame.width + 20, height: 3)
            cell.itemLabel.textColor = #colorLiteral(red: 0.1268230677, green: 0.5874770284, blue: 0.8762937188, alpha: 1)
            selectedTab = indexPath
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TabItemCollectionViewCell
        
        UIView.animate(withDuration: 0.3) {
           
            if let tab = self.selectedTab {
                let selectedCell = collectionView.cellForItem(at: tab) as! TabItemCollectionViewCell
                selectedCell.itemLabel.textColor = .black
            }
            
            cell.itemLabel.textColor = #colorLiteral(red: 0.1268230677, green: 0.5874770284, blue: 0.8762937188, alpha: 1)
            self.inline.frame = CGRect(x: cell.frame.minX, y: 0, width: cell.frame.width, height: 3)
        }
        
        selectedTab = indexPath
    }
    
}

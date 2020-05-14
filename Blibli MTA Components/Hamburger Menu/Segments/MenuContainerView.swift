//
//  MenuContainerView.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/6/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class MenuContainerView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var menus: [MenuItem] =
        [MenuItem(name: "Dashboard", image: nil, destination: nil),
        MenuItem(name: "Product", image: nil, destination: nil),
        MenuItem(name: "Order", image: nil, destination: nil),
        MenuItem(name: "Analytics", image: nil, destination: nil)]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        Bundle.main.loadNibNamed("MenuContainerView", owner: self, options: nil)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib.init(nibName: "MenuItemTableViewCell", bundle: nil), forCellReuseIdentifier: "menuItemCell")
    }
    
}


extension MenuContainerView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItemCell", for: indexPath) as! MenuItemTableViewCell
        cell.menuItemName.text = menus[indexPath.row].name
        cell.menuItemImage.image = menus[indexPath.row].image
        
        return cell
    }
    
    
}

//
//  NotificationViewController.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/14/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Notification"
        
        let tabs = TabSlide()
        tabs.setData(data: ["General", "News & Updates"])
        
        let chips = ChipSlide()
        chips.setData(data: ["Order", "Product Q & A", "Product"])
        
        view.addSubview(chips)
        view.addSubview(tabs)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tabs.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tabs.rightAnchor.constraint(equalTo: view.rightAnchor),
            tabs.leftAnchor.constraint(equalTo: view.leftAnchor),
            tabs.heightAnchor.constraint(equalToConstant: 60),
            
            chips.topAnchor.constraint(equalTo: tabs.bottomAnchor),
            chips.leftAnchor.constraint(equalTo: view.leftAnchor),
            chips.rightAnchor.constraint(equalTo: view.rightAnchor),
            chips.heightAnchor.constraint(equalToConstant: 60),
            
            tableView.topAnchor.constraint(equalTo: chips.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "orderNotificationCell")
    }
    
}


extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderNotificationCell", for: indexPath) as! OrderTableViewCell
        
        return cell
    }
    
}

//
//  SearchBarView.swift
//  Blibli MTA Components
//
//  Created by TEMP on 5/14/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import UIKit

class SearchBarView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var filter: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var sellers: [String] = ["Aldo Vernando", "Farhan Adji", "Budi", "Cica", "Dodi"]
    var filterSeller: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    func setUp() {
        Bundle.main.loadNibNamed("SearchBarView", owner: self, options: nil)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        filterSeller = sellers
        
        setTextFieldImage()

        filter.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "SellerTableViewCell", bundle: nil), forCellReuseIdentifier: "sellerCell")
        
    }
 
    func setTextFieldImage() {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: filter.frame.height - 10, height: filter.frame.height - 10)
        
        let image = UIImage(systemName: "magnifyingglass")
        imageView.image = image
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: filter.frame.height, height: filter.frame.height - 10))
        view.addSubview(imageView)
        
        filter.leftViewMode = .always
        filter.leftView = view
    }
}


// MARK: UITableView
extension SearchBarView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterSeller.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sellerCell", for: indexPath) as! SellerTableViewCell
        
        cell.businessPartner.text = filterSeller[indexPath.row]
        
        return cell
    }
    
}


// MARK: UITextField
extension SearchBarView: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let keyWord: String = textField.text ?? ""
        
        if keyWord != "" {
            let filtered = sellers.filter { $0.lowercased().contains(keyWord)}
            filterSeller = filtered
        }
        else {
            filterSeller = sellers
        }
                
        tableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}



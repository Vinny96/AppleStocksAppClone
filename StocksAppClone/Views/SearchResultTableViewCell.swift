//
//  SearchResultTableViewCell.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-06-05.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    static let idenfitifer = "SearchResultTableViewCell"
    
    // MARK: - Initializer and other system called functions
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .subtitle, reuseIdentifier: SearchResultTableViewCell.idenfitifer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

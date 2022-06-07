//
//  Protocols.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-06-06.
//

import Foundation

protocol DidSelectSearchResultCell
{
    func searchResultSelected(model : String) // when the model is created, the model will no longer be of type string
}

protocol NetworkCallComplete
{
    func retrievedData(model : String) // when the model is created, the model will no longer be of type string
}

//
//  Protocols.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-06-06.
//

import Foundation

protocol DidSelectSearchResultCell
{
    func searchResultSelected(model : Stock) // when the model is created, the model will no longer be of type string
}

protocol NetworkCallComplete
{
    func retrievedData(model : StockSearchResult) // when the model is created, the model will no longer be of type string
}

protocol NewsHeaderViewDelegate : AnyObject
{
    func didTapAddButton(headerView : NewsHeaderView)
}

protocol NewsFetched
{
    func retrievedData(model : NewsResult)
}

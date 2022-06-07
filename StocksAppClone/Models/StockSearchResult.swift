//
//  StockSearchResult.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-06-06.
//

import Foundation

struct StockSearchResult : Codable
{
    var count : Int
    var result : [Stock]
}

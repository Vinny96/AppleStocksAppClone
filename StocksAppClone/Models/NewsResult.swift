//
//  topNewsResult.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-08-28.
//

import Foundation

struct NewsResult : Codable
{
    var category : String
    var datetime : Int
    var headline : String
    var id : Int
    var image : URL
    var related : String
    var source : String
    var summary : String
    var url : URL
}

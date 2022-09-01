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
    var datetime : TimeInterval
    var headline : String
    var id : Int
    var image : String
    var related : String
    var source : String
    var summary : String
    var url : String
}

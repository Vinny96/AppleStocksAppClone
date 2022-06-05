//
//  DateFormatter.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-06-05.
//

import Foundation

final class DateFormatterHandler
{
    //MARK: - Properties
    static let shared = DateFormatterHandler()
    private let dateFormatter = DateFormatter()
    // MARK: - Functions
    
    internal func GetCurrentDateAsString() -> String
    {
        let currentDate = Date()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let dateAsString = dateFormatter.string(from: currentDate)
        return dateAsString
    }

    
    
    
}


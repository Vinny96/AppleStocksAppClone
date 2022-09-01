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
    
    internal func createDatesAsStringForCompanyNews() -> [String]
    {
        var arrayOfDatesAsString = [String]()
        let currentDate = Date()
        let oneMonthBack = currentDate.addingTimeInterval(-(3600 * 24 * 30))
        
        let currentDateAsString = DateFormatter.newsDateFormatter.string(from: currentDate)
        let oneMonthBackDateAsString = DateFormatter.newsDateFormatter.string(from: oneMonthBack)
        arrayOfDatesAsString.append(currentDateAsString)
        arrayOfDatesAsString.append(oneMonthBackDateAsString)
        
        return arrayOfDatesAsString
    }
    
    
}


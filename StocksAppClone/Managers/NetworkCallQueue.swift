//
//  NetworkCallQueue.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-07-16.
//

import Foundation

class NetworkCallQueue
{
    // properties
    private var underlyingArray = [URLSessionDataTask]()
    static let shared = NetworkCallQueue()
    
    
    // MARK: - Functionality
    internal func peek() -> Bool
    {
        if(underlyingArray.count == 0)
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    private func removeFromQueue()
    {
        let dataTask = underlyingArray[0]
        dataTask.cancel()
        underlyingArray.removeLast()
    }
    
    
    internal func addDataTask(dataTask : URLSessionDataTask)
    {
        let peekResult = peek()
        switch peekResult
        {
        case true:
            removeFromQueue()
            dataTask.resume()
            underlyingArray.append(dataTask)
        case false:
            dataTask.resume()
            underlyingArray.append(dataTask)
        }
    }
    
}

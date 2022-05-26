//
//  PersistenceManager.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-05-26.
//

import Foundation

final class PersistanceManager
{
    // properties
    static let shared = PersistanceManager()
    private let userDefaults = UserDefaults.standard
    var watchList : [String] = [String]()
    
    
    // initializer
    private init() {}
    
    
    
    // private functions
    private func swapSymbolPositions(indexPosToSwap : Int)
    {
        let lastIndex = watchList.count - 1
        let lastSymbol = watchList[lastIndex]
        let symbolToSwap = watchList[indexPosToSwap]
        
        // now we do the swap
        watchList[indexPosToSwap] = lastSymbol
        watchList[lastIndex] = symbolToSwap
    }
    
    
    // public function
    func addToWatchList(symbolToAdd : String)
    {
        watchList.append(symbolToAdd)
    }
    
    @discardableResult
    func removeFromWatchList(symbolToRemoveString : String) -> [String]
    {
        var indexPos = 0
        for symbol in watchList
        {
            if(symbol == symbolToRemoveString)
            {
                swapSymbolPositions(indexPosToSwap: indexPos)
                watchList.removeLast()
                // we will also have to remove from the user defaults as well
                return watchList
            }
            indexPos += 1
        }
        return watchList
    }
    
}

private struct Constants
{
    
}

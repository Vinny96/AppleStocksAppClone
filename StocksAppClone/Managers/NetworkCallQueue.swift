//
//  NetworkCallQueue.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-07-16.
//

import Foundation

struct NetworkCallQueue
{
    // properties
    private let runningTask : URLSessionDataTask
    private var underlyingArray : [URLSessionDataTask] = [URLSessionDataTask]()
    
    // initializer
    init(taskToRun : URLSessionDataTask)
    {
        runningTask = taskToRun
    }
    
    // MARK: - Functions
    
    // this function will add to the queue
    internal mutating func addDataTask(newDataTaskToAdd : URLSessionDataTask)
    {
        // we are calling remove as we always want to check if a dataTask is alredy inside before we add a new one
        removeDataTask()
        underlyingArray.append(newDataTaskToAdd)
    }
    
    // this function will remove from the queue
    private mutating func removeDataTask()
    {
        if(underlyingArray.count == 0)
        {
            return
        }
        else
        {
            let dataTask  = underlyingArray[0]
            dataTask.cancel()
            underlyingArray.removeLast()
        }
    }

}

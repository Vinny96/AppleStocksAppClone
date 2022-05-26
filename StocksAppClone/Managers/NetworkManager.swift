//
//  NetworkManager.swift
//  StocksAppClone
//
//  Created by Vinojen Gengatharan on 2022-05-26.
//

import Foundation

final class NetworkManager
{
    // properties
    static let shared = NetworkManager()
    
    
    // initializer
    private init(){}
    
    
    // internal functions
    func getStockInfo()
    {
        
        
        
    }
    
    
    func searchForStock()
    {
        
        
    }
    
    // private functions
    private func createURL(for endpoint : Endpoint, queryParams : [String : String]) -> URL?
    {
        return nil
    }
    
    private func request<T:Codable>(url : URL?, expecting : T.Type, completion : @escaping(Result<T,Error>) -> Void)
    {
        guard let safeURL = url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: safeURL) { data, response, error in
            guard let safeData = data, nil == error else {
                if let error = error
                {
                    completion(.failure(error))
                    return
                }
                else
                {
                    completion(.failure(NetworkError.noDataReturned))
                }
                return
            }
            // success
            do
            {
                let result = try JSONDecoder().decode(expecting.self, from: safeData)
                completion(.success(result))
            }
            catch
            {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    
}

private struct Constants
{
    static let apiKey = ""
    static let sandboxApiKey = ""
    static let baseURL = ""
}


private enum Endpoint : String
{
    case search
    case news
}

private enum NetworkError : Error
{
    case invalidURL
    case noDataReturned
}

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
    internal func search(query : String, completion : @escaping(Result<StockSearchResult,Error>) -> Void)
    {
        guard let url = createURL(for: .search, queryParams: ["q" : query]) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        request(url: url, expecting: StockSearchResult.self) { searchResult in
            switch searchResult
            {
            case .success(let stockSearchResultObj):
                completion(.success(stockSearchResultObj))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    // private functions
    private func createURL(for endpoint : Endpoint, queryParams : [String : String]) -> URL?
    {
        var urlString = Constants.baseURL
        urlString += endpoint.rawValue
        
        var queryItems = [URLQueryItem]()
        for (name,value) in queryParams
        {
            let queryItemToAppend = URLQueryItem(name: name, value: value)
            queryItems.append(queryItemToAppend)
        }
        // adding in our api key at the end
        queryItems.append(.init(name: "token", value: Constants.apiKey))
        
        // Convert query array to suffix so we can add to url
        let queryStringArray = queryItems.map { "\($0.name)=\($0.value ?? "")" }.joined(separator: "&")
        urlString += "?" + queryStringArray
        
        return URL(string: urlString)
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
    static let apiKey = "caf66eiad3ibf4h8sjtg"
    static let sandboxApiKey = "sandbox_c59jcq2ad3i93kd1rbng"
    static let baseURL = "https://finnhub.io/api/v1/"
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

//
//  NetworkService.swift
//  newsapp
//
//  Created by Jishnu Biju [Litmus7] on 19/03/25.
//

import Foundation

// common network service to avoid repeated code use to fetch news
protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(from endpoint: String, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    private let baseURL = "https://newsapi.org/v2/"
    private let apiKey = "127723d3b99e4c6e8d48cf8bf082614a"
    
    func fetchData<T: Decodable>(from endpoint: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let urlString = baseURL + endpoint + "?apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.unknown(NSError(domain: "Invalid Response", code: 0))))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.serverError(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                print("Error Decoding data: \(error)")
                completion(.failure(.decodingError))
            }
        }
        task.resume()
        
    }
}

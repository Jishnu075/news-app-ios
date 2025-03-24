//
//  HeadlinesViewModel.swift
//  newsapp
//
//  Created by Jishnu Biju [Litmus7] on 19/03/25.
//

import Foundation

class HeadlinesViewModel {
    private let networkService: NetworkServiceProtocol
    
    private(set) var headlines: [Article] = [] //?? clear it
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchHeadlines() -> Void {
        networkService.fetchData(from: "top-headlines?country=us") { (result: Result<HeadlinesModel, NetworkError>) in
          switch result {
            case .success(let data):
              self.headlines = data.articles
              print(self.headlines)
              
            case .failure(let error):
              print("Error: \(error)")
            }

        }
        
    }
}

//
//  NewsModel.swift
//  newsapp
//
//  Created by Jishnu Biju [Litmus7] on 19/03/25.
//

import Foundation

struct HeadlinesModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source?
    let author, title, description, url, urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Decodable {
    let id, name: String?
}

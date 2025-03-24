//
//  NetworkError.swift
//  newsapp
//
//  Created by Jishnu Biju [Litmus7] on 19/03/25.
//
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(Int)
    case unknown(Error)
}

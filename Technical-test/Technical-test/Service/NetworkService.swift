//
//  NetworkService.swift
//  Technical-test
//
//  Created by Andrey Kravtsov on 16.04.2023.
//

import Foundation

protocol NetworkServicing: AnyObject {
    func request(url: URL) async throws -> Data
}

class NetworkService: NetworkServicing {
    func request(url: URL) async throws -> Data {
        return try await withCheckedThrowingContinuation({ continuation in
            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    continuation.resume(returning: data)
                } else if let error = error {
                    continuation.resume(throwing: error)
                }
            }
            dataTask.resume()
        })
    }
}

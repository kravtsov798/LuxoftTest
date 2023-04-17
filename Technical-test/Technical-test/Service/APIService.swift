//
//  APIService.swift
//  Technical-test
//
//  Created by Andrey Kravtsov on 16.04.2023.
//

import Foundation

protocol APIServicing: AnyObject {
    func fetchQuotes() async throws -> [Quote]
}

class APIService: APIServicing {
    private static let path = "https://www.swissquote.ch/mobile/iphone/Quote.action?formattedList&formatNumbers=true&listType=SMI&addServices=true&updateCounter=true&&s=smi&s=$smi&lastTime=0&&api=2&framework=6.1.1&format=json&locale=en&mobile=iphone&language=en&version=80200.0&formatNumbers=true&mid=5862297638228606086&wl=sq"
    
    private let networkService: NetworkServicing
    
    init(networkService: NetworkServicing) {
        self.networkService = networkService
    }
    
    func fetchQuotes() async throws -> [Quote] {
        guard let url = URL(string: APIService.path) else {
            throw APIServiceError.invalidURL
        }
        
        let data = try await networkService.request(url: url)
        let quotes = try JSONDecoder().decode([Quote].self, from: data)
        
        return quotes
    }
}

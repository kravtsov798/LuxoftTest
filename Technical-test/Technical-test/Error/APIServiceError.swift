//
//  APIServiceError.swift
//  Technical-test
//
//  Created by Andrey Kravtsov on 16.04.2023.
//

import Foundation

enum APIServiceError: LocalizedError {
    case invalidURL
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Cannot get URL from the path string."
        }
    }
}

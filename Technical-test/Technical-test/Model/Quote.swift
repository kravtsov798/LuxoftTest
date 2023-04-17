//
//  Quote.swift
//  Technical-test
//
//  Created by Patrice MIAKASSISSA on 29.04.21.
//

import UIKit

final class Quote {
    var symbol:String?
    var name:String?
    var currency:String?
    var readableLastChangePercent:String?
    var last:String?
    var variationColor:String?
    var myMarket:Market?
    var isFavorite = false
    
    func variationUIColor() -> UIColor? {
        guard let color = variationColor else { return nil }
        return VariationColor(rawValue: color)?.uiColor
    }
}

// MARK: - VariationColor
extension Quote {
    private enum VariationColor: String {
        case green = "green"
        case red = "red"
        
        var uiColor: UIColor {
            switch self {
            case .green:
                return UIColor.green
            case .red:
                return UIColor.red
            }
        }
    }
}

// MARK: - confirm Decodable
extension Quote: Decodable {
    enum CodingKeys: String, CodingKey {
        case symbol
        case name
        case currency
        case readableLastChangePercent
        case last
        case variationColor
        case myMarket
    }
}

//
//  QuoteCell + Constant.swift
//  Technical-test
//
//  Created by Andrey Kravtsov on 17.04.2023.
//

import UIKit

extension QuoteCell {
    enum Constant {
        enum VStack {
            static let leadingSpacing: CGFloat = 20
            static let trailingSpacing: CGFloat = 20
            static let topSpacing: CGFloat = 10
            static let bottomSpacing: CGFloat = 10
            static let interItemSpacing: CGFloat = 5
        }
        
        enum NameLabel {
            static let font = UIFont.systemFont(ofSize: 14)
        }
        
        enum LastCurrencyLabel {
            static let font = UIFont.systemFont(ofSize: 14)
        }
        
        enum LastChangePercentLabel {
            static let font = UIFont.systemFont(ofSize: 20)
            static let topSpacing: CGFloat = 10
            static let bottomSpacing: CGFloat = 10
            static let trailingSpacing: CGFloat = 20
            static let widthSpacing: CGFloat = 100
        }
        
        enum IsFavoriteImage {
            static let trailingSpacing: CGFloat = 20
            static let sideSize: CGFloat = 25
            static let favoriteImage = UIImage(named: "favorite")
            static let noFavoriteImage = UIImage(named: "no-favorite")
        }
    }
}

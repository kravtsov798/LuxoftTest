//
//  QuoteDetailsPresenter.swift
//  Technical-test
//
//  Created by Andrey Kravtsov on 17.04.2023.
//

import Foundation

protocol QuoteDetailsPresenter: AnyObject {
    func showQuoteDetailsScreen(with quote: Quote)
}

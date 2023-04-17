//
//  QuotesListViewModel.swift
//  Technical-test
//
//  Created by Andrey Kravtsov on 16.04.2023.
//

import Foundation

@MainActor
protocol QuotesListViewModelDelegate: AnyObject {
    func reloadTableView()
}

protocol QuotesListViewRepresentable: AnyObject {
    var delegate: QuotesListViewModelDelegate? { get set }
    var quotesCount: Int { get }
    
    func fetchQuotes()
    func quoteCellData(at index: Int) -> QuoteCellData?
    func showQuoteDetails(at index: Int)
}

class QuotesListViewModel: QuotesListViewRepresentable {
    weak var delegate: QuotesListViewModelDelegate?
    var quotesCount: Int { market?.quotes?.count ?? 0 }
    private weak var detailsPresenter: QuoteDetailsPresenter?
    private let apiService: APIServicing
    private var market: Market?
    
    init(detailsPresenter: QuoteDetailsPresenter,
         apiService: APIServicing) {
        self.detailsPresenter = detailsPresenter
        self.apiService = apiService
    }
    
    func fetchQuotes() {
        Task { [weak self] in
            guard let self else { return }
            let quotes = try await self.apiService.fetchQuotes()
            self.market = Market()
            self.market?.quotes = quotes
            await self.delegate?.reloadTableView()
        } catch: { error in
            print(error.localizedDescription)
        }
    }
    
    func quoteCellData(at index: Int) -> QuoteCellData? {
        guard let quote = quote(at: index) else { return nil }
        let quoteCellData = createQuoteCellData(from: quote)
        return quoteCellData
    }
    
    func showQuoteDetails(at index: Int) {
        guard let quote = quote(at: index) else { return }
        detailsPresenter?.showQuoteDetailsScreen(with: quote)
    }
    
    private func quote(at index: Int) -> Quote? {
        guard let market, let quotes = market.quotes else {
            return nil
        }
        
        guard index < quotes.count else {
            return nil
        }
        
        let quote = quotes[index]
        return quote
    }
    
    private func createQuoteCellData(from quote: Quote) -> QuoteCellData {
        let quoteCellData = QuoteCellData(
            name: quote.name ?? "unknown",
            last: quote.last ?? "unknown",
            currency: quote.currency ?? "unknown",
            lastChangePercent: quote.readableLastChangePercent ?? "unknown",
            isFavorite: quote.isFavorite,
            lastChangePercentColor: quote.variationUIColor()
        )
        return quoteCellData
    }
}

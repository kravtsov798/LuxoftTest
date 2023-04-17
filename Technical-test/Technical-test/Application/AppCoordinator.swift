//
//  AppCoordinator.swift
//  Technical-test
//
//  Created by Andrey Kravtsov on 17.04.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    private let window: UIWindow
    private var navigationController: UINavigationController?
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showQuotesListScreen()
    }
}

// MARK: - confirm QuotesListPresenter
extension AppCoordinator: QuotesListPresenter {
    func showQuotesListScreen() {
        let viewModel = createQuotesListViewModel()
        let viewController = QuotesListViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }
    
    private func createQuotesListViewModel() -> QuotesListViewRepresentable {
        let networkService = NetworkService()
        let apiService = APIService(networkService: networkService)
        let viewModel = QuotesListViewModel(detailsPresenter: self,
                                            apiService: apiService)
        return viewModel
    }
}

// MARK: - confirm QuoteDetailsPresenter
extension AppCoordinator: QuoteDetailsPresenter {
    func showQuoteDetailsScreen(with quote: Quote) {
        let viewController = QuoteDetailsViewController(quote: quote)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

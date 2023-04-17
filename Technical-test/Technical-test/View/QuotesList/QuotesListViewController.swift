//
//  QuotesListViewController.swift
//  Technical-test
//
//  Created by Patrice MIAKASSISSA on 29.04.21.
//

import UIKit

class QuotesListViewController: UIViewController {
    private var viewModel: QuotesListViewRepresentable
    private lazy var contentView = QuotesListView()
    private var tableView: UITableView { contentView.tableView }
    
    init(viewModel: QuotesListViewRepresentable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationAppearance()
        viewModel.fetchQuotes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func configureNavigationAppearance() {
        title = Constant.title
        customizeNavBarAppearance()
    }
    
    private func customizeNavBarAppearance() {
        let navBar = navigationController?.navigationBar

        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = .white

        let compactAppearance = standardAppearance.copy()
        compactAppearance.backgroundColor = .white
        
        navBar?.standardAppearance = standardAppearance
        navBar?.scrollEdgeAppearance = standardAppearance
        navBar?.compactAppearance = compactAppearance
        if #available(iOS 15.0, *) {
            navBar?.compactScrollEdgeAppearance = compactAppearance
        }
    }
}

// MARK: - confirm UITableViewDelegate
extension QuotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showQuoteDetails(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - confirm UITableViewDataSource
extension QuotesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.quotesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: QuoteCell.reuseIdentifier, for: indexPath
        ) as? QuoteCell,
              let cellData = viewModel.quoteCellData(at: indexPath.row)
        else {
            return UITableViewCell()
        }
        cell.update(with: cellData)
        return cell
    }
}

// MARK: - confirm
extension QuotesListViewController: QuotesListViewModelDelegate {
    func reloadTableView() {
        tableView.reloadData()
    }
}

// MARK: - Constant
extension QuotesListViewController {
    enum Constant {
        static let title = "Quotes"
    }
}

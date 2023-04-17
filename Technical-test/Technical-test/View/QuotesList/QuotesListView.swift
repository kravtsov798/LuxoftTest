//
//  QuotesListView.swift
//  Technical-test
//
//  Created by Andrey Kravtsov on 16.04.2023.
//

import UIKit

class QuotesListView: UIView {
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupTableView()
        setupTableViewConstraints()
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.register(QuoteCell.self,
                           forCellReuseIdentifier: QuoteCell.reuseIdentifier)
    }
    
    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

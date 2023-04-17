//
//  QuoteCell.swift
//  Technical-test
//
//  Created by Andrey Kravtsov on 16.04.2023.
//

import UIKit

struct QuoteCellData {
    let name: String
    let last: String
    let currency: String
    let lastChangePercent: String
    let isFavorite: Bool
    let lastChangePercentColor: UIColor?
}

class QuoteCell: UITableViewCell {
    static var reuseIdentifier: String { String(describing: self) }
    
    private let nameLabel = UILabel()
    private let lastCurrencyLabel = UILabel()
    private let lastChangePercentLabel = UILabel()
    private let isFavoriteImage = UIImageView()
    private let vStack = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        lastCurrencyLabel.text = nil
        lastChangePercentLabel.text = nil
        isFavoriteImage.image = nil
    }
    
    func update(with data: QuoteCellData) {
        nameLabel.text = data.name
        lastCurrencyLabel.text = data.last + " " + data.currency
        lastChangePercentLabel.text = data.lastChangePercent
        lastChangePercentLabel.textColor = data.lastChangePercentColor
        isFavoriteImage.image = data.isFavorite
        ? Constant.IsFavoriteImage.favoriteImage
        : Constant.IsFavoriteImage.noFavoriteImage
    }
    
    private func commonInit() {
        setupSubviews()
        setupSubviewsConstraints()
    }
    
    private func setupSubviews() {
        setupIsFavoriteImage()
        setupLastChangePercentLabel()
        setupVStack()
        setupVStackSubviews()
    }
    
    private func setupSubviewsConstraints() {
        setupIsFavoriteImageConstraints()
        setupLastChangePercentLabelConstraints()
        setupVStackConstraints()
    }

    // MARK: vStack
    private func setupVStack() {
        contentView.addSubview(vStack)
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.spacing = Constant.VStack.interItemSpacing
    }
    
    private func setupVStackConstraints() {
        vStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constant.VStack.leadingSpacing
            ),
            vStack.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant:  Constant.VStack.topSpacing
            ),
            vStack.trailingAnchor.constraint(
                equalTo: lastChangePercentLabel.leadingAnchor,
                constant:  -Constant.VStack.trailingSpacing
            ),
            vStack.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant:  -Constant.VStack.bottomSpacing
            ),
        ])
    }
    
    private func setupVStackSubviews() {
        setupNameLabel()
        setupLastCurrencyLabel()
    }
    
    private func setupNameLabel() {
        vStack.addArrangedSubview(nameLabel)
        nameLabel.font = Constant.NameLabel.font
    }
    
    private func setupLastCurrencyLabel() {
        vStack.addArrangedSubview(lastCurrencyLabel)
        lastCurrencyLabel.font = Constant.LastCurrencyLabel.font
    }
    
    // MARK: lastChangePercentLabel
    private func setupLastChangePercentLabel() {
        addSubview(lastChangePercentLabel)
        lastChangePercentLabel.font = Constant.LastChangePercentLabel.font
        lastChangePercentLabel.textAlignment = .right
    }
     
    private func setupLastChangePercentLabelConstraints() {
        lastChangePercentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lastChangePercentLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constant.LastChangePercentLabel.topSpacing
            ),
            lastChangePercentLabel.trailingAnchor.constraint(
                equalTo: isFavoriteImage.leadingAnchor,
                constant: -Constant.LastChangePercentLabel.trailingSpacing
            ),
            lastChangePercentLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Constant.LastChangePercentLabel.bottomSpacing
            ),
            lastChangePercentLabel.widthAnchor.constraint(
                equalToConstant: Constant.LastChangePercentLabel.widthSpacing
            )
        ])
    }
    
    // MARK: isFavoriteImage
    private func setupIsFavoriteImage() {
        contentView.addSubview(isFavoriteImage)
        isFavoriteImage.contentMode = .scaleAspectFit
    }
    
    private func setupIsFavoriteImageConstraints() {
        isFavoriteImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            isFavoriteImage.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constant.IsFavoriteImage.trailingSpacing
            ),
            isFavoriteImage.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            isFavoriteImage.heightAnchor.constraint(
                equalToConstant: Constant.IsFavoriteImage.sideSize
            ),
            isFavoriteImage.widthAnchor.constraint(
                equalTo: isFavoriteImage.heightAnchor
            )
        ])
    }
}

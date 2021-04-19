//
//  ProductCell.swift
//  LMTestTask
//
//  Created by Vladimir Udachin on 16.04.2021.
//

import UIKit

class ProductCell: UICollectionViewCell {
    static var reuseIdentifier = "ProductCell"
    
    // MARK: - UI Outlets
    private lazy var productImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupSubViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(productPriceLabel)
        contentView.addSubview(productNameLabel)
    }
    
    private func setupCell() {
        setupSubViews()
        
        layer.cornerRadius = 4
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([

            productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImageView.bottomAnchor.constraint(equalTo: productPriceLabel.topAnchor, constant: -2),

            productPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            productPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            productPriceLabel.bottomAnchor.constraint(equalTo: productNameLabel.topAnchor, constant: -2),

            productNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            productNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
            
        ])
    }
    
    // MARK: - Public Methods
    func configure(with model: Product) {
        productImageView.image = UIImage(named: model.image)
        productPriceLabel.text = String(model.price ?? 0.00) + "₽/шт."
        productNameLabel.text = model.name ?? ""
    }

}

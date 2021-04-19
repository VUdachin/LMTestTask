//
//  DepartmentCell.swift
//  LMTestTask
//
//  Created by Vladimir Udachin on 17.04.2021.
//

import UIKit

class DepartmentCell: UICollectionViewCell {
    static var reuseIdentifier = "DepartmentCell"
    
    // MARK: - UI Outlets
    private lazy var productImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
    }
    
    private func setupCell() {
        setupSubViews()
        
        NSLayoutConstraint.activate([
 
            productImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)

        ])
    }
    
    // MARK: - Public Methods
    func configure(with model: Product) {
        productImageView.image = UIImage(named: model.image)
    }
    
    func configureAsCatalogCell() {
        productImageView.image = UIImage(named: "Catalog")
    }
    
    func configureAsMoreCell() {
        productImageView.image = UIImage(named: "WatchAll")
    }

}

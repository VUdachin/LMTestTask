//
//  HorizontalCell.swift
//  LMTestTask
//
//  Created by Vladimir Udachin on 17.04.2021.
//

import UIKit

class HorizontalCell: UICollectionViewCell {
    static let reuseIdentifier = "HorizontalCell"

    // MARK: - UI Outlets
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()

    private var products: [Product]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    private func setupView() {
        setupCollectionView()
        setupSubView()

        let safeArea = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)

        ])
    }

    private func setupSubView() {
        addSubview(collectionView)
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
        collectionView.register(DepartmentCell.self, forCellWithReuseIdentifier: DepartmentCell.reuseIdentifier)

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Public Methods
    func configureCell(with model: [Product]) {
        products = model
    }

}

extension HorizontalCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = products?[indexPath.row] else { fatalError() }
        if model.price == nil {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DepartmentCell.reuseIdentifier, for: indexPath) as? DepartmentCell else { fatalError() }
            cell.configure(with: model)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier, for: indexPath) as? ProductCell else { fatalError() }
            cell.configure(with: model)
            return cell
        }
        
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let model = products?[indexPath.row]
        if model?.price == nil {
            return CGSize(width: (frame.width / 3 - 16), height: (frame.width / 3) - 16)
        } else {
            return CGSize(width: (frame.width / 3) - 16, height: (frame.height))
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
}


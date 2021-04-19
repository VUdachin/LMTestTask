//
//  HeaderView.swift
//  LMTestTask
//
//  Created by Vladimir Udachin on 16.04.2021.
//

import UIKit

class SectionsHeaderView: UICollectionReusableView {
    static var reuseIdentifier = "SectionsHeader"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(titleLabel)
    }
    
    private func setupHeader() {
        setupSubviews()
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
    
    func configureSection(with title: String?) {
        titleLabel.text = title
    }
    
}

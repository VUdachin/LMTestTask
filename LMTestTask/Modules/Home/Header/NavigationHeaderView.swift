//
//  NavigationHeader.swift
//  LMTestTask
//
//  Created by Vladimir Udachin on 18.04.2021.
//

import UIKit

class NavigationHeaderView: UICollectionReusableView {
    static var reuseIdentifier = "NavigationHeader"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        label.text = "Поиск товаров"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var searchTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Поиск"
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 4
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
//    private lazy var searchButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .green
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    private lazy var qrButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.setImage(UIImage(systemName: "qrcode"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeader()
        backgroundColor = UIColor.leroyMerlinColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(searchTextField)
        addSubview(qrButton)
    }
    
    private func setupHeader() {
        setupSubviews()
        
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            
            searchTextField.heightAnchor.constraint(equalToConstant: 35),
            searchTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            searchTextField.trailingAnchor.constraint(equalTo: qrButton.leadingAnchor, constant: -inset),
            searchTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            qrButton.heightAnchor.constraint(equalTo: searchTextField.heightAnchor),
            qrButton.widthAnchor.constraint(equalTo: qrButton.heightAnchor),
            qrButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            qrButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            qrButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

}

//
//  NavigationHeader.swift
//  LMTestTask
//
//  Created by Vladimir Udachin on 18.04.2021.
//

import UIKit

class NavigationHeaderView: UIView {
    static var reuseIdentifier = "NavigationHeader"
    
    // MARK: - UI Outlets
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.text = "Поиск товаров"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var searchTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Поиск"
        tf.setPlaceholderInset(14)
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 4
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.leroyMerlinColor
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var qrButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.tintColor = .black
        button.setImage(UIImage(systemName: "qrcode"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Public Property
    var textFieldTrailingAnchor = NSLayoutConstraint()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeader()
        backgroundColor = UIColor.leroyMerlinColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(searchTextField)
        addSubview(qrButton)
        addSubview(searchButton)
    }
    
    private func setupHeader() {
        setupSubviews()
        
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            
            searchTextField.heightAnchor.constraint(equalToConstant: 45),
            searchTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),

            searchTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            
            
            searchButton.topAnchor.constraint(equalTo: searchTextField.topAnchor, constant: 6),
            searchButton.bottomAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: -6),
            searchButton.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: -inset),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            
            qrButton.heightAnchor.constraint(equalTo: searchTextField.heightAnchor),
            qrButton.widthAnchor.constraint(equalTo: qrButton.heightAnchor),
            qrButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            qrButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            qrButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            
        ])
        
        textFieldTrailingAnchor = searchTextField.trailingAnchor.constraint(equalTo: qrButton.leadingAnchor, constant: -inset)
        textFieldTrailingAnchor.isActive = true
        
    }
    
    //MARK: - Public Methods
    func changeHeaderAlfa(with alpha: CGFloat) {
        searchButton.alpha = alpha > 1 ? 1 : alpha
        qrButton.alpha = alpha > 1 ? 1 : alpha
        titleLabel.alpha = alpha > 1 ? 1 : alpha
    }
    
    func setDefaultConstraints() {
        textFieldTrailingAnchor = searchTextField.trailingAnchor.constraint(equalTo: qrButton.leadingAnchor, constant: -8)
        textFieldTrailingAnchor.isActive = true
    }

}


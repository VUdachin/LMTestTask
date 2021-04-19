//
//  ViewController.swift
//  LMTestTask
//
//  Created by Vladimir Udachin on 16.04.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Outlets
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView()
        return cv
    }()
    
    // MARK: - Private Properties
    private var mockData: [HomeSection] = [HomeSection(type: "department",
                                               items: [Product(name: "Сад", image: "tachila"),
                                                       Product(name: "Освещение", image: "tachila"),
                                                       Product(name: "Инструменты", image: "tachila"),
                                                       Product(name: "Стройматериалы", image: "tachila"),
                                                       Product(name: "Декор", image: "tachila")]),
                                   HomeSection(type: "limited", title: "Предложение ограничено",
                                               items: [Product(name: "Штукатурка гипсовая Knauf", price: 460.00, image: "Knauf"),
                                                       Product(name: "Керамогранит Evroceramica", price: 730.35, image: "Evroceramica"),
                                                       Product(name: "Светильник потолочный LED 'Rimini'", price: 4685.00, image: "Rimini"),
                                                       Product(name: "Грунтовка глубокого проникновения", price: 725.00, image: "Gruntovka"),
                                                       Product(name: "Перфоратор SDS-Plus", price: 7927.00, image: "Sds")]),
                                   HomeSection(type: "bestPrice", title: "Лучшая цена",
                                               items: [Product(name: "Обои флезелиновые Vagnerplast", price: 1068.00, image: "Oboi"),
                                                       Product(name: "Кашпо Idea Дюна светлый", price: 790.00, image: "Kashpo"),
                                                       Product(name: "Средство для мытья стёкол Prosept 0.5 л", price: 116.00, image: "Stekla"),
                                                       Product(name: "Средство для акриловых ванн 0.5 л", price: 118.00, image: "Vanni")
                                               ])
    ]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
//        setupNavigationBar()
//        addSearchController()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        navigationController?.navigationBar.sizeToFit()
//    }
    
    
    
    
    
    // MARK: - Private Methods
//    private func setupNavigationBar() {
//        title = "Поиск товаров"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.barTintColor = .white
//        navigationController?.navigationBar.isTranslucent = false
//        extendedLayoutIncludesOpaqueBars = false
//        navigationItem.hidesSearchBarWhenScrolling = false
//        let scrollEdgeAppearance = UINavigationBarAppearance()
//        scrollEdgeAppearance.backgroundColor = UIColor.leroyMerlinColor
//        scrollEdgeAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        let standardAppearance = UINavigationBarAppearance()
//        standardAppearance.backgroundColor = .white
//        standardAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        navigationController?.navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
//        navigationController?.navigationBar.standardAppearance = standardAppearance
//    }
//
//    private func addSearchController() {
//        let searchController = UISearchController(searchResultsController: nil)
//        searchController.searchBar.searchTextField.backgroundColor = .white
//        searchController.searchBar.searchTextField.borderStyle = .none
//        searchController.searchBar.searchTextField.layer.cornerRadius = 4
//        searchController.searchBar.searchTextField.leftView = nil
//        searchController.searchBar.placeholder = "Поиск"
//        searchController.obscuresBackgroundDuringPresentation = false
//        navigationItem.searchController = searchController
//    }
    
    private func setupView() {
        view.backgroundColor = .white

        let safeArea = view.safeAreaLayoutGuide

        setupCollectionView()
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)

        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HorizontalCell.self, forCellWithReuseIdentifier: HorizontalCell.reuseIdentifier)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
        collectionView.register(SectionsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionsHeaderView.reuseIdentifier)
        collectionView.register(NavigationHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NavigationHeaderView.reuseIdentifier)

        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCell.reuseIdentifier, for: indexPath) as? HorizontalCell,
              let model = mockData[indexPath.section].items else { fatalError() }
        cell.configureCell(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let data = mockData[indexPath.section].title
        
        if indexPath.section == 0 {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NavigationHeaderView.reuseIdentifier, for: indexPath) as? NavigationHeaderView else { fatalError() }
            return headerView
        } else {
            if (kind == UICollectionView.elementKindSectionHeader) {
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionsHeaderView.reuseIdentifier, for: indexPath) as? SectionsHeaderView else { fatalError() }
                headerView.configureSection(with: data ?? "")
                return headerView
            }
        }
        fatalError()
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.15)
        } else {
            return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.3)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: (UIScreen.main.bounds.size.width), height: 150)
        } else {
            return CGSize(width: (UIScreen.main.bounds.size.width), height: 50)
        }
    }
    
}


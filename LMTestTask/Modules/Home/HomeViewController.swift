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
    
    private lazy var navigationHeaderView: NavigationHeaderView = {
        let view = NavigationHeaderView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 170)
        return view
    }()
    
    
    
    // MARK: - Private Properties
    private var mockData: [HomeSection] = [HomeSection(type: "department",
                                               items: [Product(name: "Каталог", image: "Catalog"),
                                                       Product(name: "Сад", image: "Sad"),
                                                       Product(name: "Освещение", image: "Osveshenie"),
                                                       Product(name: "Инструменты", image: "Instrumenti"),
                                                       Product(name: "Стройматериалы", image: "Stroika"),
                                                       Product(name: "Декор", image: "Decor"),
                                                       Product(name: "Смотреть всё", image: "WatchAll")]),
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

    }

    
    //MARK: - Private Methods
    private func setupView() {
        view.backgroundColor = .white

        let safeArea = view.safeAreaLayoutGuide

        setupCollectionView()
        view.addSubview(collectionView)
        view.addSubview(navigationHeaderView)

        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: navigationHeaderView.bottomAnchor),
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

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if mockData.count == 0 {
            collectionView.setEmptyMessage("Что-то пошло не так.")
        } else {
            collectionView.restoreState()
        }
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
        if (kind == UICollectionView.elementKindSectionHeader) {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionsHeaderView.reuseIdentifier, for: indexPath) as? SectionsHeaderView else { fatalError() }
            headerView.configureSection(with: data ?? "")
            return headerView
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
            return CGSize(width: (UIScreen.main.bounds.size.width), height: 50)
    }
    
    // MARK: - UICollectionViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = -scrollView.contentOffset.y + 170
        let height = max(y, 90)
        navigationHeaderView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)

        let alpha = (y - 90) / 60
        navigationHeaderView.changeHeaderAlfa(with: alpha)
        
        if y <= 90 {
            self.navigationHeaderView.qrButton.isHidden = true
            self.navigationHeaderView.searchButton.isHidden = true
            self.navigationHeaderView.textFieldTrailingAnchor.constant = 0
            UIView.animate(withDuration: 0.15) {
                self.navigationHeaderView.backgroundColor = .white
            }
        } else {
            navigationHeaderView.qrButton.isHidden = false
            navigationHeaderView.searchButton.isHidden = false
            self.navigationHeaderView.setDefaultConstraints()
            UIView.animate(withDuration: 0.15) {
                self.navigationHeaderView.backgroundColor = UIColor.leroyMerlinColor
            }
        }
    }
    
}



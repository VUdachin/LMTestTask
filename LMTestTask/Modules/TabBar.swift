//
//  TabBar.swift
//  LMTestTask
//
//  Created by Vladimir Udachin on 18.04.2021.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        tabBar.tintColor = UIColor.leroyMerlinColor
    }
    
    func setupVC() {
          viewControllers = [
            createController(for: HomeViewController(), title: "Главная", image: UIImage(systemName: "magnifyingglass")!),
            createController(for: HomeViewController(), title: "Мой список", image: UIImage(systemName: "magnifyingglass")!),
            createController(for: HomeViewController(), title: "Магазины", image: UIImage(systemName: "magnifyingglass")!),
            createController(for: HomeViewController(), title: "Профиль", image: UIImage(systemName: "person")!),
            createController(for: HomeViewController(), title: "Корзина", image: UIImage(systemName: "magnifyingglass")!)
//              createNavController(for: HomeViewController(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
//              createNavController(for: HomeViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
//              createNavController(for: HomeViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
          ]
      }
    
    fileprivate func createController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let vc = rootViewController
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        return vc
    }
 

}

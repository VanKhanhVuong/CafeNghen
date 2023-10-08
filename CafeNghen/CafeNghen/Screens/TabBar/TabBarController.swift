//
//  TabBarController.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 08/10/2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeViewController())
        let explore = self.createNav(with: "Explore", and: UIImage(systemName: "rectangle.and.text.magnifyingglass"), vc: ExploreViewController())
        let cart = self.createNav(with: "Cart", and: UIImage(systemName: "cart"), vc: CartViewController())
        let favorite = self.createNav(with: "Favorites", and: UIImage(systemName: "heart"), vc: FavoritesViewController())
        let account = self.createNav(with: "Account", and: UIImage(systemName: "person"), vc: AccountViewController())
        
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .black
        self.setViewControllers([home, explore, cart, favorite, account], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
//        nav.tabBarItem = UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key : Any]?, for: .normal)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        return nav
    }

}

//
//  MainTabBarController.swift
//  newsapp
//
//  Created by Jishnu Biju [Litmus7] on 11/03/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let headlinesVC = HeadlinesViewController()
        let searchVC = SearchViewController()
        
        headlinesVC.tabBarItem = UITabBarItem(title: "Headlines", image: UIImage(systemName: "house"), tag: 0)
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        let headlinesNav = UINavigationController(rootViewController: headlinesVC)
        let searchNav = UINavigationController(rootViewController: searchVC)
        
        viewControllers = [headlinesNav, searchNav]
        
    }

}

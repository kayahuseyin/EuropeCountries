//
//  ECTabBarController.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 3.02.2024.
//

import UIKit

class ECTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .systemBackground
        UITabBar.appearance().backgroundColor = .gray
        viewControllers = [createHomeVC(), createSavedVC()]
    }
    
    func createHomeVC() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: Constants.home, tag: 0)
        
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createSavedVC() -> UINavigationController {
        let savedVC = SavedVC()
        savedVC.tabBarItem = UITabBarItem(title: "Saved", image: Constants.heart, tag: 1)
        
        return UINavigationController(rootViewController: savedVC)
    }
}

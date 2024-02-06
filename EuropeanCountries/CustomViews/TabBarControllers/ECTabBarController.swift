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
        
        configureTabBar()
    }
    
    func configureTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.black
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
           
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
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

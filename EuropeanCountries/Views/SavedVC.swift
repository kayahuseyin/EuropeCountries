//
//  SavedVC.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 3.02.2024.
//

import UIKit

class SavedVC: UIViewController {
    
    let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0)]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.titleTextAttributes = attributes
        title = "Countries"
    }
}

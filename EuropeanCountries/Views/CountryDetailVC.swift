//
//  CountryDetailVC.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 7.02.2024.
//

import UIKit

class CountryDetailVC: UIViewController {

    var country : Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = country?.name.common
    }
}

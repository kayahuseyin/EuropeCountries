//
//  ECButton.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 5.02.2024.
//

import UIKit

class ECButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setBackgroundImage(Constants.star, for: .normal)
        tintColor = .systemGray
        translatesAutoresizingMaskIntoConstraints = false
    }
}

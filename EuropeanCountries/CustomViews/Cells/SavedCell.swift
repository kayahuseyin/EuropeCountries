//
//  SavedCell.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 3.02.2024.
//

import UIKit

class SavedCell: UITableViewCell { // Degistir

    static let reuseID = "SavedCell"
    var countryName = ECLabel(fontSize: 14, textWeight: .regular)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(country: Country) {
        countryName.text = country.name.common
    }
    
    
    private func configure() {
        addSubview(countryName)
        accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            countryName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countryName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            countryName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            countryName.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

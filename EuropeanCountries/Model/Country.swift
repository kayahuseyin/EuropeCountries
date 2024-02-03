//
//  Country.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 3.02.2024.
//

import Foundation

struct Country: Decodable {
    var name: Name!
    
    struct Name: Codable {
        var common: String
    }
}

//
//  CountryDetail.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 3.02.2024.
//

import Foundation

struct CountryDetail: Decodable {
    var name: Name
    var population: Int
    var capital: [String]
    var maps: Maps
    var flags: Flags
        
    struct Name: Codable {
        var common: String
    }
    
    struct Maps: Codable {
        var googleMaps: String
    }
    
    struct Flags: Codable {
        var png: String
    }
    
}

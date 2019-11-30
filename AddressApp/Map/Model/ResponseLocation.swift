//
//  ResponseLocation.swift
//  AddressApp
//
//  Created by Mac1 on 11/30/19.
//  Copyright © 2019 Mac1. All rights reserved.
//

import Foundation

struct ResponseLocation: Decodable {
    var address: Address
}

struct Address: Decodable {
    var house_number: String?
    var road: String?
    var city: String?
    var country: String?
}

extension Address {
    func addressString() -> String {
        let resultArray = [country, city, road, house_number].compactMap{$0}.joined(separator: ", ")
        return "Current Location:\n\(resultArray)"
    }
}

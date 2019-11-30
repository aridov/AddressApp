//
//  AddressAppTests.swift
//  AddressAppTests
//
//  Created by Mac1 on 11/30/19.
//  Copyright © 2019 Mac1. All rights reserved.
//

import XCTest
@testable import AddressApp

class AddressAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLocationAddressString() {
        let responseLocationAddress1 = Address(house_number: nil, road: "E95", city: nil, country: "United States")
        let locationString1 = "Current Location:\nUnited States, E95"
        XCTAssertEqual(locationString1, responseLocationAddress1.addressString())
        
        let responseLocationAddress2 = Address(house_number: nil, road: nil, city: "Buenos Aires", country: "Argentina")
        let locationString2 = "Current Location:\nArgentina, Buenos Aires"
        XCTAssertEqual(locationString2, responseLocationAddress2.addressString())
        
        let responseLocationAddress3 = Address(house_number: nil, road: nil, city: nil, country: "Antarctica")
        let locationString3 = "Current Location:\nAntarctica"
        XCTAssertEqual(locationString3, responseLocationAddress3.addressString())
        
        let responseLocationAddress4 = Address(house_number: "42", road: "Khreshatyk", city: "Kiev", country: "Ukraine")
        let locationString4 = "Current Location:\nUkraine, Kiev, Khreshatyk, 42"
        XCTAssertEqual(locationString4, responseLocationAddress4.addressString())
    }
}

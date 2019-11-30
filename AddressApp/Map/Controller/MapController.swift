//
//  MapController.swift
//  AddressApp
//
//  Created by Mac1 on 11/30/19.
//  Copyright © 2019 Mac1. All rights reserved.
//

import UIKit
import CoreLocation

class MapController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestLocationServices()
    }
    
    fileprivate func requestLocationServices() {
        LocationService.shared.startUpdatingLocation(delegate: self)
    }
}

extension MapController: LocationServiceDelegate {
    func didChangeLocation(_ location: CLLocation) {
        print("Current Location: (\(location.coordinate.latitude), \(location.coordinate.latitude))")
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    
}

//
//  LocationService.swift
//  AddressApp
//
//  Created by Mac1 on 11/30/19.
//  Copyright © 2019 Mac1. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate {
    func didChangeLocation(_ location: CLLocation)
    func didFailWithError(_ error: Error)
}

class LocationService: NSObject, CLLocationManagerDelegate {
 
    static let shared = LocationService()
    let locationManager: CLLocationManager
    var currentLocation: CLLocation
    
    var delegate: LocationServiceDelegate?
    
    private override init() {
        currentLocation = CLLocation()
        
        self.locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = true

        super.init()
        
        locationManager.delegate = self
    }
    
    func startUpdatingLocation(delegate: LocationServiceDelegate) {
        self.delegate = delegate
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.startUpdatingLocation()
        } else{
            //service disabled error
        }
    }
}

fileprivate extension LocationService {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocation = locations.last {
            if (currentLocation.distance(from: newLocation) > 0) {
                currentLocation = newLocation
                delegate?.didChangeLocation(currentLocation)
            }
        }
    }
    
    fileprivate func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.didFailWithError(error)
    }
    
    fileprivate func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            if (CLLocationManager.locationServicesEnabled()) {
                locationManager.startUpdatingLocation()
            }
        }
    }
}

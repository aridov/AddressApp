//
//  MapController.swift
//  AddressApp
//
//  Created by Mac1 on 11/30/19.
//  Copyright © 2019 Mac1. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

fileprivate struct MapConstants {
    static var regionRadius: CLLocationDistance = 1000
}

class MapController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    fileprivate var didRequestLocation = false
    fileprivate var currentPoint: MKPointAnnotation = MKPointAnnotation()
    
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
        if (!didRequestLocation) {
            didRequestLocation = true
            mapView.addAnnotation(currentPoint)
        }
        
        let coordinate = location.coordinate
        
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: MapConstants.regionRadius, longitudinalMeters: MapConstants.regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        
        currentPoint.coordinate = coordinate
        
        addressLabel.text = "Current Location:\n(\(location.coordinate.latitude), \(location.coordinate.longitude))"
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

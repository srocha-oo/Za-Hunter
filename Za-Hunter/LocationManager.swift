//
//  LocationManager.swift
//  Za-Hunter
//
//  Created by stephanie rocha marquez on 2/19/26.
//

import Foundation
import CoreLocation
@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

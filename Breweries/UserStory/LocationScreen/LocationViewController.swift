//
//  LocationViewController.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 18.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController {
    
    private let latitudeString: String
    private let longitudeString: String
    private let contentView = MKMapView()
    private let annotation = MKPointAnnotation()
    
    init(latitudeString: String, longitudeString: String) {
        self.latitudeString = latitudeString
        self.longitudeString = longitudeString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setApperanceForNavBar(backgroundColor: R.color.darkGrassGreen())
        
        contentView.mapType = .standard
        contentView.isZoomEnabled = true
        contentView.isScrollEnabled = true
        contentView.addAnnotation(annotation)
        
        pinPosition()
    }
    
    private func pinPosition() {
        let latitude = (latitudeString as NSString).doubleValue
        let longitude = (longitudeString as NSString).doubleValue
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        centerMapOnLocation(location: CLLocation(latitude: latitude, longitude: longitude))
    }
    
    private func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 2000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        contentView.setRegion(coordinateRegion, animated: true)
    }
}

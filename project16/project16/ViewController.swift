//
//  ViewController.swift
//  project16
//
//  Created by Yvette Zhukovsky on 9/12/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
   // var web = WebViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Maps", style: .plain, target: self, action: #selector(alert))
        
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 summer olympics", url: URL(string:"https://en.wikipedia.org/wiki/London")!)

        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago", url: URL( string:"https://en.wikipedia.org/wiki/Oslo")!)
        
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light", url: URL( string:"https://en.wikipedia.org/wiki/Paris")!)
        
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has the whole country inside it", url: URL( string:"https://en.wikipedia.org/wiki/Rome")!)
        
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself", url: URL( string:"https://en.wikipedia.org/wiki/Washington")!)
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
    
       
    }
    
    @objc func alert(){
       let ac = UIAlertController(title: "Choose a map", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Standard", style: .default
            , handler: setMap))
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default
                   , handler: setMap))
               
        ac.addAction(UIAlertAction(title: "Satellite", style: .default
        , handler: setMap))
        ac.addAction(UIAlertAction(title: "Hybrid Flyover", style: .default
        , handler: setMap))
        ac.addAction(UIAlertAction(title: "Satellite Flyover", style: .default
        , handler: setMap))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
         present(ac, animated: true)
       
    }
    
    func setMap(action: UIAlertAction){
        if action.title == "Standard"  {
            mapView.mapType = .standard
        } else if action.title == "Hybrid" {
            mapView.mapType = .hybrid
        } else if action.title == "Satellite" {
            mapView.mapType = .satellite
         } else if action.title == "Hybrid Flyover" {
             mapView.mapType = .hybridFlyover
        } else if action.title == "Satellite Flyover" {
            mapView.mapType = .satelliteFlyover

    }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else {return nil}
        let identifier = "Capital"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.pinTintColor = .cyan
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else {return}
       guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "webVC") as? WebViewController else { return }
        
//        let placeName = capital.title
//        let placeInfo = capital.info
       // vc.city = capital
        vc.url = capital
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


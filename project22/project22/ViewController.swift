//
//  ViewController.swift
//  project22
//
//  Created by Yvette Zhukovsky on 10/28/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//
import CoreLocation
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var distanceReading: UILabel!
    var locationManager: CLLocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        view.backgroundColor = .gray
    }


    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func startScanning(){
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(in: beaconRegion)
    }
    static func showAlertMessage(vc: UIViewController, titleStr:String, messageStr:String) -> Void {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert)
        vc.present(alert, animated: true, completion: nil)
    }
    
    
    func updateDistance(distance: CLProximity) {
        var isAlertShown = false
        UIView.animate(withDuration: 1) {
            switch distance {
             case .far:
                self.view.backgroundColor = .blue
                self.distanceReading.text = "FAR"
                
             case .near:
                isAlertShown = true
                self.view.backgroundColor = .orange
                self.distanceReading.text = "NEAR"
                if isAlertShown {
                    ViewController.showAlertMessage(vc: self, titleStr: "You are near beacon", messageStr: "Beacon detected!")
                    isAlertShown = false
                }
                
            case .immediate:
                self.view.backgroundColor = .red
                self.distanceReading.text = "RIGHT HERE "
          default:
                self.view.backgroundColor = .gray
                self.distanceReading.text = "UNKNOWN"
            }
        }
    }
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
            updateDistance(distance: beacon.proximity)
        } else {
            updateDistance(distance: .unknown)
        }
        
         
    }
    
}


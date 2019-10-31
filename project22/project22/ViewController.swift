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
    
    @IBOutlet var secondLabel: UILabel!
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
        let uuid1 = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!
        let uuid2 = UUID(uuidString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")!
        let beaconRegion1 = CLBeaconRegion(proximityUUID: uuid1, major: 123, minor: 456, identifier: "MyFirstBeacon")
        let beaconRegion2 = CLBeaconRegion(proximityUUID: uuid2, major: 123, minor: 456, identifier: "MySecondBeacon")
        locationManager?.startMonitoring(for: beaconRegion1)
        locationManager?.startRangingBeacons(in: beaconRegion1)
        locationManager?.startMonitoring(for: beaconRegion2)
        locationManager?.startRangingBeacons(in: beaconRegion2)
    }
    static func showAlertMessage(vc: UIViewController, titleStr:String, messageStr:String) -> Void {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert)
        vc.present(alert, animated: true, completion: nil)
    }
    
    
    func updateDistance(distance: CLProximity, label: UILabel) {
        var isAlertShown = false
        UIView.animate(withDuration: 1) {
            switch distance {
             case .far:
                self.view.backgroundColor = .blue
                label.text = "FAR"
                
             case .near:
                isAlertShown = true
                self.view.backgroundColor = .orange
                label.text = "NEAR"
                if isAlertShown {
                    ViewController.showAlertMessage(vc: self, titleStr: "You are near beacon", messageStr: "Beacon detected!")
                    isAlertShown = false
                }
                
            case .immediate:
                self.view.backgroundColor = .red
                label.text = "RIGHT HERE "
          default:
                self.view.backgroundColor = .gray
                label.text = "UNKNOWN"
            }
        }
    }
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
            if region.identifier == "MyFirstBeacon" {
                updateDistance(distance: beacon.proximity, label: self.distanceReading)
            } else if region.identifier == "MySecondBeacon"  {
            updateDistance(distance: beacon.proximity, label: self.secondLabel)
            } else {
                updateDistance(distance: .unknown, label: self.distanceReading)
        }
        }
         
    }
    
}


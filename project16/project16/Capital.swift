//
//  Capital.swift
//  project16
//
//  Created by Yvette Zhukovsky on 9/12/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import UIKit
import MapKit


class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var url: URL
    init(title: String, coordinate: CLLocationCoordinate2D, info: String, url: URL){
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.url = url
    }
}

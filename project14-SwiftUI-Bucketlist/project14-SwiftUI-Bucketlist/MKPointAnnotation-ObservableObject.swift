//
//  MKPointAnnotation-ObservableObject.swift
//  project14-SwiftUI-Bucketlist
//
//  Created by Yvette Zhukovsky on 12/6/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown Value"
        }
        set {
            title = newValue
        }
    }
    
    public var wrappedSubTitle: String {
        get {
                self.subtitle ?? "Unknown Value"
            }
            set {
                subtitle = newValue
            }
        }
        
        
    
}

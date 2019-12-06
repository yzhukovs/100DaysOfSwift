//
//  MapView.swift
//  project14-SwiftUI-Bucketlist
//
//  Created by Yvette Zhukovsky on 12/5/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var annotations: [MKPointAnnotation]
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
        
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView){
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
            print(mapView.centerCoordinate)
        }
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)-> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
        
       
    
    }
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
    
        return mapView
    }
    
    
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
    let annotation = MKPointAnnotation()
    annotation.title = "London"
    annotation.subtitle = "Home to 2012 Summer Olympics"
    annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
   return annotation
}
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), annotations: [MKPointAnnotation.example])
    }
}

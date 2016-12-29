//
//  HotalMapTableViewCell.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 29..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit
import MapKit

// Custom tableViewCell that displays a mapView inside it
class HotalMapTableViewCell: UITableViewCell, MKMapViewDelegate {

    // Map to display the hotel's location
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    // Set the separator to be full width
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layoutMargins = UIEdgeInsets.zero
        separatorInset = UIEdgeInsets.zero
    }

    // Prepares for reusing the cell, removing all annotations
    override func prepareForReuse() {
        super.prepareForReuse()
        mapView.removeAnnotations(mapView.annotations)
    }
    
    // Set the separator to be full width as frame changes
    override func layoutSubviews() {
        super.layoutSubviews()
        separatorInset = UIEdgeInsets.zero
    }
    
    // Adds the hotel's location to the map and zooms to that location
    // parameter Hotel Object
    
    func zoomMaptoHotelLocation(_ hotelObject: Hotel) {
        let annotationPoint = MKPointAnnotation()
        print("Hotel's geopoint: \(hotelObject.location)")
        annotationPoint.coordinate = hotelObject.coordinate()
        mapView.addAnnotation(annotationPoint)
        
        mapView.setCenter(hotelObject.coordinate(), animated: false)
        mapView.showAnnotations(mapView.annotations, animated: false)
        mapView.setRegion(MKCoordinateRegion(center: annotationPoint.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0045, longitudeDelta: 0.0045)), animated: false)
    }
    
    /**
     Return what annotation views should be used for each annotation
     
     :param: mapView    The map view that requested the annotation view.
     :param: annotation The object representing the annotation that is about to be displayed.
     
     :returns: The annotation view to display for the specified annotation or nil if you want to display a standard annotation view.
     */
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        } else {
            let annotationView = hotelListAnnnotationView(annotation: annotation, reuseIdentifier: "Hotel")
            if annotation.isKind(of: hotelLocationAnnotationPoint.self) {
                let annotationPoint = annotation as! hotelLocationAnnotationPoint
                annotationView.canShowCallout = false
                annotationView.annotation = annotationPoint
            }
            return annotationView
        }
    }

}

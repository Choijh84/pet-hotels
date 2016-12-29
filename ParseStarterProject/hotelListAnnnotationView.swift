//
//  hotelListAnnnotationView.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 30..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit
import MapKit

class hotelListAnnnotationView: MKAnnotationView {
    
    /// Custom view that helps identifying the Hotel object better
    fileprivate var markerView: hotelListMarkerView!
    
    /**
     Initialiser method. Set the frame for the view, and add the markerView as a subview.
     
     :param: annotation      the annotation
     :param: reuseIdentifier the identifier
     
     :returns: self
     */
    override init(annotation: MKAnnotation!, reuseIdentifier: String!) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        markerView = hotelListMarkerView(frame: CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0))
        markerView.isUserInteractionEnabled = true
        addSubview(markerView)
    }
    
    /**
     Initialiser method
     
     :param: aDecoder NSCoder object
     
     :returns: self
     */
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    /**
     Initialiser method
     
     :param: frame frame to use
     
     :returns: self
     */
    convenience init(frame: CGRect) {
        self.init(frame: frame)
    }

}

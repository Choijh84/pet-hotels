//
//  hotelLocationAnnotationPoint.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 30..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit
import MapKit

/**
 *  A custom MKAnnotationPoint to be able to assign our hotel Object to it, for later use.
 */

class hotelLocationAnnotationPoint: MKPointAnnotation {
    
    /// The hotelObject that is assigned to this point annotation
    var hotelObject: Hotel?
}

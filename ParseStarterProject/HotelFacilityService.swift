//
//  HotelFacilityService.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 26..
//  Copyright © 2016년 Parse. All rights reserved.
//

import Foundation
import UIKit

class HotelFacilityService: NSObject {
    var CCTV = false
    var photoReport = false
    var organicFeed = false
    var dailyCleaning = false
    var bath = false
    var nightDoctor = false
    var parking = false
    var walking = false
    var allDay = false
    var hotel: Hotel!
    
    init(hotel: Hotel) {
        self.hotel = hotel
    }
}

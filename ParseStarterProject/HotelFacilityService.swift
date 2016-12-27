//
//  HotelFacilityService.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 26..
//  Copyright © 2016년 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

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
    
    var hotel: Hotel? = nil
    var objectId = ""
    
    override init() {
        print("HotelFacilityService has initialized")
    }
    
    init(hotel: Hotel) {
        self.hotel = hotel
    }
    
    init(obj: PFObject) {
        self.CCTV = obj.value(forKey: "CCTV") as! Bool
        self.photoReport = obj.value(forKey: "photoReport") as! Bool
        self.organicFeed = obj.value(forKey: "organicFeed") as! Bool
        self.dailyCleaning = obj.value(forKey: "dailyCleaning") as! Bool
        self.bath = obj.value(forKey: "bath") as! Bool
        self.nightDoctor = obj.value(forKey: "nightDoctor") as! Bool
        self.parking = obj.value(forKey: "parking") as! Bool
        self.walking = obj.value(forKey: "walking") as! Bool
        self.allDay = obj.value(forKey: "allDay") as! Bool
        self.objectId = obj.value(forKey: "objectId") as! String
        // self.roomHotel = obj.value(forKey: "roomHotel") as! Hotel
    }
}

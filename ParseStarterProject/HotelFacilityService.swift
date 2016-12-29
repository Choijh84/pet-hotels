//
//  HotelFacilityService.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 29..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit
import Parse


class HotelFacilityService: NSObject {

    var objectId: String?
    var CCTV: Bool?
    var photoReport: Bool?
    var organicFeed: Bool?
    var dailyCleaning: Bool?
    var bath: Bool?
    var nightDoctor: Bool?
    var parking: Bool?
    var walking: Bool?
    var allDay: Bool?
    
    override init() {
        objectId = ""
        CCTV = false
        photoReport = false
        organicFeed = false
        dailyCleaning = false
        bath = false
        nightDoctor = false
        parking = false
        walking = false
        allDay = false
        
    }
    
    init(obj: PFObject) {
        
        self.objectId = obj.value(forKey: "objectId") as? String
        self.CCTV = obj.value(forKey: "CCTV") as? Bool
        self.photoReport = obj.value(forKey: "photoReport") as? Bool
        self.organicFeed = obj.value(forKey: "organicFeed") as? Bool
        self.dailyCleaning = obj.value(forKey: "dailyCleaning") as? Bool
        self.bath = obj.value(forKey: "bath") as? Bool
        self.nightDoctor = obj.value(forKey: "nightDoctor") as? Bool
        self.parking = obj.value(forKey: "parking") as? Bool
        self.walking = obj.value(forKey: "walking") as? Bool
        self.allDay = obj.value(forKey: "allDay") as? Bool
    }
}

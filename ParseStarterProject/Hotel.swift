//
//  Hotel.swift
//  ParseStarterProject-Swift
//
//  Created by Ken Choi on 2016. 12. 24..
//  Copyright © 2016년 Parse. All rights reserved.
//

import Foundation
import Parse

class Hotel: NSObject {
    
    var objectId: String?
    // Name of the Hotel
    var name : String?
    // Address of the Hotel
    var address: String?
    // PhoneNumber of the Hotel
    var phone : String?
    // website of the Hotel
    var homepage: String?
    
    // Image of the hotel
    var mainPhoto: Data?
    // the URL for the image of the Hotel
    var imageURL: String?
    
    // Location from Parse
    var location: PFGeoPoint?
    // Distance between current and hotel's location
    var distance: Double?
    
    // Email address of the pet hotel
    var emailAddress: String?
    // Category of the Hotel (Pet Hospital, Pet Cafe, Pet Shop, etc.)
    var parentCategory: String?
    
    // Short Description of the Hotel
    var hotelDescription: String?
    
    // /// Array of Review objects that connected with the Hotel
    var reviews: [Review] = [] {
        didSet {
            var average: Double = 0
            for review in reviews {
                average += review.rating.doubleValue
            }
            self.reviewAverage = NSNumber(value: average / Double(reviews.count))
            self.reviewCount = reviews.count as NSNumber?
        }
    }
    
    // Number of reviews
    var reviewCount: NSNumber?
    // Average Rating
    var reviewAverage: NSNumber?

    /**
     Creates a coordinate of the Hotel from the location object, if no location object is found, creates a 0,0 coordinate
     
     - returns: coordinate of the Hotel
     */
    func coordinate() -> CLLocationCoordinate2D {
        if location != nil {
            return CLLocationCoordinate2DMake(location!.latitude, location!.longitude)
        }
        return CLLocationCoordinate2DMake(0, 0)
    }
    
    /**
     Calculates the distance between the current location and the location of the hotel
     
     :param: currentLocation the user's current location
     */
    func calculateDistanceBetweenCurrentLocation(_ currentLocation: CLLocation?) {
        if (currentLocation != nil) {
            let coordinate = self.coordinate()
            distance = currentLocation!.distance(from: CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)) as Double
            print("Distance: \(distance!)")
        }
    }
    
    /**
     Returns a formatted distance string, e.g.: 1,4 km away
     
     :return: NSString - formatted distance string
     */
    func distanceString() -> String! {
        if let distance = distance {
            if distance == 0 { // when distance is zero, return an empty string
                return ""
            }
            else {
                return NSString.distanceStringWithValue(distance) as String
            }
        }
        return ""
    }
    
    override init() {
        self.name = "HOTEL"
    }
    
    init(name: String!, phone:String!) {
        self.name = name
        self.phone = phone
        self.homepage = ""
        self.address = ""
        let data = UIImageJPEGRepresentation(#imageLiteral(resourceName: "image-placeholder"), 1.0)
        self.mainPhoto = data
    }
    
    init(name: String!, phone:String!, homepage: String!, address: String, mainPhoto: Data) {
        self.name = name
        self.phone = phone
        self.homepage = homepage
        self.address = address
        self.mainPhoto = mainPhoto
    }
    
    init(obj: PFObject) {
        self.objectId = obj.value(forKey: "objectId") as? String
        self.name = obj.value(forKey: "name") as? String
        self.phone = obj.value(forKey: "phone") as? String
        self.homepage = obj.value(forKey: "homepage") as? String
        self.address = obj.value(forKey: "address") as? String
        self.location = obj.value(forKey: "location") as? PFGeoPoint
        let tfile = obj.value(forKey: "mainPhoto") as! PFFile
        do {
            try self.mainPhoto = tfile.getData() 
        } catch {
            print("Error in mainphoto of hotel")
        }
    }
}

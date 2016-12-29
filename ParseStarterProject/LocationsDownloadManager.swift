//
//  LocationDownloadManager.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 30..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit
import MapKit
import Parse

/**
 *  Class is intended to be used to download hotel objects
 */

class LocationsDownloadManager: NSObject {
    
    /// User's location coordinate object
    var userCoordinate: CLLocationCoordinate2D!
    
    /// selected hotel category
    var selectedHotelCategory: HotelCategory?
    
    /// selected sorting option
    var selectedSortingOption: SortingOption = SortingOption(name: "distance", sortingKey: SortingKey.distance)
    
    /// Store object that handles downloading of Hotel Objects
    var dataStore = [Hotel]()
    
    /**
     Download Store objects
     
     - parameter skip:            items to skip, that were loaded before
     - parameter limit:           max amount of Store objects to load
     - parameter completionBlock: called after the request is completed, returns the StoreObjects
     */
    
    func downloadHotels(skippingNumberOfObjects skip: NSNumber, limit: NSNumber, completionHandler: @escaping (_ hotelObjects: [Hotel]?, _ error: String?) -> ()) {
        let query = PFQuery(className: "Hotels")
        
        if selectedSortingOption.sortingKey != SortingKey.distance {
            query.addDescendingOrder("\(selectedSortingOption.sortingKey!.rawValue)")
        }
        query.limit = Int(limit)
        query.skip = Int(skip)
        query.includeKey("location")
        query.includeKey("parentCategory")
        
        let userGeoPoint = PFGeoPoint(latitude: userCoordinate.latitude, longitude: userCoordinate.longitude)
        // 현재는 반경이 100km
        query.whereKey("location", nearGeoPoint: userGeoPoint, withinKilometers: 100)
        
        if let selectedHotelCategory = selectedHotelCategory {
            query.whereKey("parentCategory", equalTo: selectedHotelCategory)
        }
        
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                for object in objects! {
                    self.dataStore.append(Hotel(obj: object))
                }
                completionHandler(self.dataStore, nil)
            } else {
                print(error?.localizedDescription)
                completionHandler(nil, error?.localizedDescription)
            }
        }
    }
    
    /**
     Creates a location
     
     - parameter hotel: hotel
     
     - returns: Location
     */
    
    fileprivate func locationForHotel(_ hotel: Hotel) -> CLLocation {
        return CLLocation(latitude: Double(hotel.location!.latitude), longitude: Double(hotel.location!.longitude))
    }
    
}

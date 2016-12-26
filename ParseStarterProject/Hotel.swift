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
    var name : String!
    var phone : String?
    var homepage: String?
    var address: String?
    var mainPhoto: Data?
    var objectId: String?
    
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
        self.name = obj.value(forKey: "name") as! String
        self.phone = obj.value(forKey: "phone") as? String
        self.homepage = obj.value(forKey: "homepage") as? String
        self.address = obj.value(forKey: "address") as? String
        let tfile = obj.value(forKey: "mainPhoto") as! PFFile
        do {
            try self.mainPhoto = tfile.getData() 
        } catch {
            print("Error in mainphoto of hotel")
        }
    }
}

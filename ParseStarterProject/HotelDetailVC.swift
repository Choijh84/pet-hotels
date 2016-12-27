//
//  HotelDetailVC.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 26..
//  Copyright © 2016년 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class HotelDetailVC: UITableViewController {
    
    // It's the header of the sections. The first empty section header is use for header.
    let header = ["Hotel_Detail", "Rooms", "Info"]
    
    var selectedHotel = Hotel(name: "", phone: "")
    var roomList = [Rooms]()
    var FacilityService = HotelFacilityService()
    var FacilityServiceDic = [String: Bool]()
    var ServiceName = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            
            if selectedHotel.name != "" {
                cell.hotelName.text = selectedHotel.name
                if selectedHotel.mainPhoto != nil {
                    cell.coverImageView.image = UIImage(data: selectedHotel.mainPhoto!)
                } else {
                    cell.coverImageView.image = #imageLiteral(resourceName: "image-placeholder")
                }
                
                cell.hotelAddress.text = selectedHotel.address
                cell.hotelPrice.text = "Still Working"
            }
            
            return cell
            
        } else if (indexPath.row == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCategory", for: indexPath) as! RoomCell
            
            self.getRoomList()
            cell.roomList = roomList
            
            return cell
        } else if (indexPath.row == 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HotelFacilityService", for: indexPath) as! HotelFacilityServiceCell
            
            self.getFacilityServiceList()
            self.mapObjectToDictionary()
            self.returnValue()
            
            cell.ServiceName = ServiceName
            print("WE got \(ServiceName.count) Service List")
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HotelFacilityService", for: indexPath) as! HotelFacilityServiceCell
            
            return cell
        }
    }
    
    func returnValue() {
        
        ServiceName.removeAll()
        for (area, value) in FacilityServiceDic {
            if value == true {
                ServiceName.append(area)
            }
        }
        print(ServiceName)
    }
    
    func mapObjectToDictionary() {
        if FacilityService.allDay == true {
            FacilityServiceDic["allDay"] = true
        }
        if FacilityService.bath == true {
            FacilityServiceDic["bath"] = true
        }
        if FacilityService.CCTV == true {
            FacilityServiceDic["CCTV"] = true
        }
        if FacilityService.dailyCleaning == true {
            FacilityServiceDic["dailyCleaning"] = true
        }
        if FacilityService.nightDoctor == true {
            FacilityServiceDic["nightDoctor"] = true
        }
        if FacilityService.organicFeed == true {
            FacilityServiceDic["organicFeed"] = true
        }
        if FacilityService.parking == true {
            FacilityServiceDic["parking"] = true
        }
        if FacilityService.photoReport == true {
            FacilityServiceDic["photoReport"] = true
        }
        if FacilityService.walking == true {
            FacilityServiceDic["walking"] = true
        }
        print(FacilityServiceDic)
    }
    
    func getFacilityServiceList() {
        
        let innerQuery = PFQuery(className: "Hotels")
        innerQuery.whereKey("name", equalTo: selectedHotel.name)
        
        let query = PFQuery(className: "HotelFacilityService")
        query.whereKey("hotel", matchesQuery: innerQuery)
        
        do {
            let objects = try query.findObjects()
            for object in objects {
                print("This is Faciliry Service List Object Id: \(object.objectId)")
                self.FacilityService = HotelFacilityService(obj: object)
            }
        } catch {
            print(error)
        }
    }
    
    func getRoomList() {
        
        print("This is \(selectedHotel.objectId!)")
        let innerQuery = PFQuery(className: "Hotels")
        innerQuery.whereKey("name", equalTo: selectedHotel.name)
        
        let query = PFQuery(className: "Rooms")
        query.whereKey("roomHotel", matchesQuery: innerQuery)
        
        do {
            let objects = try query.findObjects()
            for object in objects {
                print("This is Hotel Room List Object Id: \(object.objectId)")
                self.roomList.append(Rooms(obj: object))
            }
        } catch {
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return header.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}

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
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCategory", for: indexPath) as! RoomCell
            
            self.getRoomList()
            cell.roomList = roomList
            
            return cell
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
                print(object.objectId!)
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

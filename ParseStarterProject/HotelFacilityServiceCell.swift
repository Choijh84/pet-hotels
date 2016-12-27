//
//  HotelFacilityServiceCell.swift
//  PetHotels-Swift
//
//  Created by Ken Choi on 2016. 12. 27..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit

class HotelFacilityServiceCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var ServiceName = [""]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ServiceName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotelFacilityServiceCell", for: indexPath) as! HotelFacilityServiceCollectionViewCell
        
        let service_name = ServiceName[indexPath.row]
        
        print("This is service name: \(service_name)")
        cell.FaciltyServiceIcon.image = UIImage(named: service_name )
        cell.FaciltyServiceLabel.text = service_name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 80)
    }

}

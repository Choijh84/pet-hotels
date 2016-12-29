//
//  HotelTableViewController.swift
//  PetHotels-Swift
//
//  Created by Owner on 2016. 12. 23..
//  Copyright © 2016년 Parse. All rights reserved.
//

import UIKit
import Parse

class HotelTableViewCell: UITableViewCell {
    // Background view of the Hotel Image
    @IBOutlet weak var hotelPhoto: UIImageView!
    // the hotel name label
    @IBOutlet weak var hotelName: UILabel!
    // the hotel address label
    @IBOutlet weak var hotelAddress: UILabel!
    // the hotel category label, this hotel belong to
    @IBOutlet weak var hotelCategory: UILabel!
    // Background view of the distance Label
    @IBOutlet weak var distanceLabelBackgroundView: UIView!
    // Label to display the distance of the Hotel from the user
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        distanceLabelBackgroundView.layer.cornerRadius = 6.0
        distanceLabelBackgroundView.backgroundColor = .white
        distanceLabel.textColor = UIColor.globalTintColor()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
}

class HotelTableViewController: UITableViewController {

    var hotels : [Hotel]? = []
    
    @IBAction func logout(_ sender: Any) {
        PFUser.logOut()
        performSegue(withIdentifier: "logoutSegue", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "Hotels")
        query.findObjectsInBackground { (objects, error) in
            
            if error == nil {
                // Query success
                // print("Successful retrived \(objects!.count) numbers")
                
                // Do Sth with the found objects
                if let objects = objects {
                    for object in objects {
                        print("Hotel's name is \(object["name"])")
                        self.hotels?.append(Hotel(obj: object))
                    }
                }
                self.tableView.reloadData()
            } else {
                // Log details of the failure
                print("Error: \(error!)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HotelTableViewCell
        let hotel = self.hotels![indexPath.row]
        
        cell.hotelPhoto.image = UIImage(data: hotel.mainPhoto! as Data)
        cell.hotelName.text = hotel.name
        cell.hotelAddress.text = hotel.address
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHotelDetails" {
            let detailViewVC = segue.destination as! HotelDetailVC
            
            let myIndexPath = self.tableView.indexPathForSelectedRow
            let hotelSelected = hotels?[(myIndexPath?.row)!]
            
            detailViewVC.selectedHotel = hotelSelected!
            
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let hotelSelected = hotels?[indexPath.row]
//        let detailViewVC: HotelDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "HotelDetailVC") as! HotelDetailVC
//        
//        detailViewVC.selectedHotel = hotelSelected!
//        self.present(detailViewVC, animated: true, completion: nil)
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

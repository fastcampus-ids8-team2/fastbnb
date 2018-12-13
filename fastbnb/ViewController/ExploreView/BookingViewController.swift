//
//  BookingViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 11/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import GoogleMaps



class BookingViewController: UIViewController {

    // cell data from the otherView
    var data: Result?
    
//    var oneImage = RoomPhoto()
    var image = String()
    var images = [String]()
    var roomData: [RoomPhoto] = []
    var arrayOfNumberOfRow = [Int]()
    var roomTitle = String()
    var roomType = String()
    
    var roomAddress = String()
    var hostImage = String()
    
    var numberOfGuest = Int()
    var numberofBedRoom = Int()
    var numberOfBed = Int()
    var numberOfBathroom = Int()
    
    var latitude = Double()
    var longtitude = Double()
    
    
   
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var checkAvailability: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // bookingData from tapped Cell
        guard let bookingData = data else { return }
       checkAvailability.layer.cornerRadius = 10
        
        
        // fake data for arrayOfNumberOfRow. We need 13
        arrayOfNumberOfRow = [1,2,3,4,5,6,7,8,9,10,11,12,13]
        
        
        // roomTitle & roomType for second tableViewCell in BookingViewController
        roomTitle = bookingData.roomName
        roomType = bookingData.roomType.rawValue
        
        // roomAddress & hostThumbNailImage for third tableviewcell
        roomAddress = bookingData.publicAddress
        hostImage = bookingData.hostimages.hostThumbnailURL
        
        
        // numberofGuest, bedroom, bed, bathroom for fourth tableviewCell
        numberOfGuest = bookingData.personCapacity
        numberofBedRoom = bookingData.bedrooms
        numberOfBed = bookingData.beds
        numberOfBathroom = bookingData.bathrooms
        
        
        // latitude and longtitude for the map
        longtitude = bookingData.lng
        latitude = bookingData.lat
        
        
        
        
        // room images in array
        for i in 0...bookingData.roomPhotos.count - 1 {
            images.append(bookingData.roomPhotos[i].roomPhoto)
        }
        
        
        
        image = bookingData.roomPhotos[0].roomPhoto
        roomData = bookingData.roomPhotos
        
        
        print("images:", images)
        
        
        
    }
    


 
}

extension BookingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfNumberOfRow.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if arrayOfNumberOfRow[indexPath.row] == 1 {
            let cell = Bundle.main.loadNibNamed("BookingImageTableViewCell", owner: self, options: nil)?.first as! BookingImageTableViewCell
        
            cell.setupCell(image: image)
            return cell
        } else if arrayOfNumberOfRow[indexPath.row] == 2 {
            
            let cell = Bundle.main.loadNibNamed("BookingRoomTitleTableViewCell", owner: self, options: nil)?.first as! BookingRoomTitleTableViewCell
            
            cell.roomTitle.text = roomTitle
            cell.roomType.text = roomType
            
            return cell
        } else if arrayOfNumberOfRow[indexPath.row] == 3 {
            
            let cell = Bundle.main.loadNibNamed("BookingRoomHostInfoTableViewCell", owner: self, options: nil)?.first as! BookingRoomHostInfoTableViewCell
            cell.roomAddress.text = roomAddress
            cell.setupCell(image: hostImage)
            print(cell.frame)
            print(cell.hostImage.frame)
//            cell.hostImage.layer.cornerRadius = cell.hostImage.frame.width / 2
            return cell
            
            
        } else if arrayOfNumberOfRow[indexPath.row] == 4 {

            let cell = Bundle.main.loadNibNamed("BookingAmenityTableViewCell", owner: self, options: nil)?.first as! BookingAmenityTableViewCell
            
            cell.roomType.text = roomType
            cell.numberOfGuest.text = "\(numberOfGuest) guests"
            cell.numberOfBedRoom.text = "\(numberofBedRoom) bedroom"
            cell.numberOfBed.text = "\(numberOfBed) beds"
            cell.numberOfBathroom.text = "\(numberOfBathroom) baths"
            
            
            return cell
            
        } else if arrayOfNumberOfRow[indexPath.row] == 5 {
        
             let cell = Bundle.main.loadNibNamed("BookingMinimumStayTableViewCell", owner: self, options: nil)?.first as! BookingMinimumStayTableViewCell
            
            return cell
        
        } else if arrayOfNumberOfRow[indexPath.row] == 6 {
            
            let cell = Bundle.main.loadNibNamed("BookingMapViewTableViewCell", owner: self, options: nil)?.first as! BookingMapViewTableViewCell
            
            let bounds = UIScreen.main.bounds
            let width = bounds.size.width
            // Create a GMSCameraPosition that tells the map to display the
            // coordinate -33.86,151.20 at zoom level 6.
            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longtitude, zoom: 16.0)
            let mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: width, height: 150), camera: camera)
            cell.mapViewBase.addSubview(mapView)
            
            
            // Creates a marker in the center of the map.
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
//            marker.title = "Sydney"
//            marker.snippet = "Australia"
            marker.map = mapView
            

            return cell
            
            
        } else if arrayOfNumberOfRow[indexPath.row] == 7 {
            
            let cell = Bundle.main.loadNibNamed("BookingCheckInNOutTableViewCell", owner: self, options: nil)?.first as! BookingCheckInNOutTableViewCell
        
            
            
            return cell

            
        } else if arrayOfNumberOfRow[indexPath.row] == 8 {
            
            let cell = Bundle.main.loadNibNamed("BookingRestTableViewCell", owner: self, options: nil)?.first as! BookingRestTableViewCell
            
            cell.mainLabel.text = "House Rules"
            cell.subLabel.text = ""
            return cell

            
        } else if arrayOfNumberOfRow[indexPath.row] == 9 {
            
            let cell = Bundle.main.loadNibNamed("BookingRestTableViewCell", owner: self, options: nil)?.first as! BookingRestTableViewCell
            
            cell.mainLabel.text = "Strct(grace period) CancellationPolicy"
            cell.subLabel.text = "Free cancellation for 48 hours"
            return cell
 
            
        } else if arrayOfNumberOfRow[indexPath.row] == 11 {
            
            let cell = Bundle.main.loadNibNamed("BookingRestTableViewCell", owner: self, options: nil)?.first as! BookingRestTableViewCell
            
            cell.mainLabel.text = "Additional Prices"
            cell.subLabel.text = ""
            return cell
     
            
        } else if arrayOfNumberOfRow[indexPath.row] == 12 {
            
            let cell = Bundle.main.loadNibNamed("BookingRestTableViewCell", owner: self, options: nil)?.first as! BookingRestTableViewCell
            
            cell.mainLabel.text = "Availability Calendar"
            cell.subLabel.text = ""
            return cell
            
            
        }else if arrayOfNumberOfRow[indexPath.row] == 13 {
            
            let cell = Bundle.main.loadNibNamed("BookingRestTableViewCell", owner: self, options: nil)?.first as! BookingRestTableViewCell
            
            cell.mainLabel.text = "Contact Host"
            cell.subLabel.text = ""
            return cell
            
            
        } else {
      
            let cell = Bundle.main.loadNibNamed("BookingMinimumStayTableViewCell", owner: self, options: nil)?.first as! BookingMinimumStayTableViewCell

            return cell
            
        }
        
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        
        if arrayOfNumberOfRow[indexPath.row] == 1 {
           
            return 150
        } else if arrayOfNumberOfRow[indexPath.row] == 2 {
            
          
            
            return 50
        } else if arrayOfNumberOfRow[indexPath.row] == 3 {
            
          
            return 50
            
            
        } else if arrayOfNumberOfRow[indexPath.row] == 4 {
            
        
            
            
            return 50
            
        } else if arrayOfNumberOfRow[indexPath.row] == 5 {
            
         
            return 50
            
        } else if arrayOfNumberOfRow[indexPath.row] == 6 {
            
          
            return 150
            
            
        } else if arrayOfNumberOfRow[indexPath.row] == 7 {
            
           
            return 50
            
            
        } else if arrayOfNumberOfRow[indexPath.row] == 8 {
            
          
            return 50
            
            
        } else if arrayOfNumberOfRow[indexPath.row] == 9 {
            
        
            return 50
            
            
        } else if arrayOfNumberOfRow[indexPath.row] == 11 {
            
          
            return 50
            
            
        } else if arrayOfNumberOfRow[indexPath.row] == 12 {
            
   
            return 50
            
            
        }else if arrayOfNumberOfRow[indexPath.row] == 13 {
     
            return 50
            
            
        } else {
            
          
            return 50
            
        }
    }
}

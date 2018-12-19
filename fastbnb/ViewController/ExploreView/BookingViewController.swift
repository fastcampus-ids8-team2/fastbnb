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
    
    var hasDate = false
    
    var savedDate: [String] = []
    
    
    
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pricePerNightLabel: UILabel!
    
    
    @IBOutlet weak var checkAvailability: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // private func to setup Price Label
        
        priceLabelSetup()
        // bookingData from tapped Cell
        guard let bookingData = data else { return }
       checkAvailability.layer.cornerRadius = 10
        
        
        // fake data for arrayOfNumberOfRow. We need 13
        arrayOfNumberOfRow = [1,2,3,4,5,6,7,8,9,10,11,12]
        
        
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
    
    private func priceLabelSetup() {
        guard let bookingData = data else { return }
        pricePerNightLabel.text = "₩\(bookingData.price) / night"
        
    }
    
    
    @IBAction func didTapCheckAvailability(_ sender: UIButton) {
        
        if hasDate == false {
        
        let checkAvailabilityVC = storyboard?.instantiateViewController(withIdentifier: "CheckAvailabilityViewController") as! CheckAvailabilityViewController
        
            checkAvailabilityVC.checkAvailabilityDateDelegate = (self as! SavedDateDelegate)
            
        
        present(checkAvailabilityVC, animated: true, completion: nil)
            hasDate.toggle()
            checkAvailability.setTitle("Saved", for: .normal)
            
            
        
        } else {
            
            let checkoutVC = storyboard?.instantiateViewController(withIdentifier: "CheckoutViewController") as! CheckoutViewController
            
            checkoutVC.data = data
        
            // savedDate has been received from checkavailability Calendar
//            print(savedDate)
            checkoutVC.bookingSavedDate = savedDate
            present(checkoutVC, animated: true, completion: nil)

            hasDate.toggle()
       }
        
    }
    @IBAction func unwindToBookingViewController(_ unwindSegue: UIStoryboardSegue) {
        checkAvailability.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
    }
    


 
}

extension BookingViewController: SavedDateDelegate {
    func savedDate(dates: [String]) {
        savedDate = dates
    }
    
    
}

extension BookingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNumberOfRow.count
    }
//    private func adScrollViewConfig() {
//        // 횡스크롤 배너
//        view.addSubview(adScrollView)
//        adScrollView.frame = CGRect(x: view.frame.origin.x, y: 105, width: view.frame.width, height: 150)
//        adScrollView.showsHorizontalScrollIndicator = false // 횡스크롤바 없음
//        adScrollView.isPagingEnabled = true
//
//        // 횡스크롤 배너에 이미지 넣기
//        adImagesArray = [UIImage(named: "ad2") , UIImage(named: "ad1"), UIImage(named: "ad3")] as! [UIImage]
//        for i in 0..<adImagesArray.count {
//            let adView = UIImageView()
//            adView.contentMode = .scaleToFill
//            adView.image = adImagesArray[i]
//
//            let xPosition = view.frame.width * CGFloat(i)
//            adView.frame = CGRect(x: xPosition, y: adScrollView.bounds.origin.y, width: adScrollView.frame.width, height: adScrollView.frame.height)
//            adScrollView.contentSize.width = adScrollView.frame.width * CGFloat((i + 1))
//
//            adScrollView.addSubview(adView)
//        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if arrayOfNumberOfRow[indexPath.row] == 1 {
            let cell = Bundle.main.loadNibNamed("BookingImageTableViewCell", owner: self, options: nil)?.first as! BookingImageTableViewCell
        
            
            // MARK: due tomorrow

//            let bookingScrollView = UIScrollView()
//
//            cell.contentView.addSubview(bookingScrollView)
//            bookingScrollView.frame = CGRect(x: cell.contentView.frame.origin.x, y: cell.contentView.frame.origin.y, width: cell.contentView.frame.width, height: cell.contentView.frame.height)
//            bookingScrollView.showsHorizontalScrollIndicator = false // 횡스크롤바 없음
//            bookingScrollView.isPagingEnabled = true
//
//            for i in 0..<images.count {
//                let adView = UIImageView()
//                adView.contentMode = .scaleToFill
//                cell.setupCell(image: images[i])
//            }
//            cell.setupCell(image: image)
            
           
            cell.scrollView.auk.show(url: images[0])
            cell.scrollView.auk.show(url: images[1])
            cell.scrollView.auk.show(url: images[2])
            cell.scrollView.auk.show(url: images[3])
            cell.scrollView.auk.show(url: images[4])
            cell.scrollView.auk.settings.contentMode = .scaleToFill
           
            
            
            return cell
        } else if arrayOfNumberOfRow[indexPath.row] == 2 {
            
            let cell = Bundle.main.loadNibNamed("BookingRoomTitleTableViewCell", owner: self, options: nil)?.first as! BookingRoomTitleTableViewCell
            
            cell.roomTitle.text = roomTitle
            cell.roomType.text = roomType
            
            return cell
        } else if arrayOfNumberOfRow[indexPath.row] == 3 {
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "BookingRoomHostInfoTableViewCell") as? BookingRoomHostInfoTableViewCell
            if cell == nil {
                let xib = UINib(nibName: "BookingRoomHostInfoTableViewCell", bundle: nil)
                tableView.register(xib, forCellReuseIdentifier: "BookingRoomHostInfoTableViewCellXib")
                cell = tableView.dequeueReusableCell(withIdentifier: "BookingRoomHostInfoTableViewCellXib") as? BookingRoomHostInfoTableViewCell
            }
            cell!.roomAddress.text = roomAddress
            cell!.setupCell(imageName: hostImage)
            
            
            return cell!
            
//            BookingRoomHostInfoTableViewCell
            
//            let cell = Bundle.main.loadNibNamed("BookingRoomHostInfoTableViewCell", owner: self, options: nil)?.first as! BookingRoomHostInfoTableViewCell
//            return cell
            
            
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
            let height = bounds.size.height
            
            let mapHeight = height * 0.2 - 0
            
//            cell.lableForHeight.font.withSize(mapHeight)
//
//            testLabel.font.withSize(testLabel.frame.height * 2/3)
//            cell.labelHeightConst.constant.native = CGFloat.NativeType(mapHeight)
            
            
            
//            var contentHeight = cell.contentView.bounds.size.height
//            contentHeight = mapHeight
//
            
            // Create a GMSCameraPosition that tells the map to display the
            // coordinate -33.86,151.20 at zoom level 6.
            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longtitude, zoom: 16.0)
            let mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: width, height: mapHeight), camera: camera)

            mapView.settings.scrollGestures = false
            

            cell.mapViewBase.addSubview(mapView)
//            cell.mapViewBase.addSubview(mapView)
            
            
            
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
 
            
        } else if arrayOfNumberOfRow[indexPath.row] == 10 {
            
            let cell = Bundle.main.loadNibNamed("BookingRestTableViewCell", owner: self, options: nil)?.first as! BookingRestTableViewCell
            
            cell.mainLabel.text = "Additional Prices"
            cell.subLabel.text = ""
            return cell
     
            
        } else if arrayOfNumberOfRow[indexPath.row] == 11 {
            
            let cell = Bundle.main.loadNibNamed("BookingRestTableViewCell", owner: self, options: nil)?.first as! BookingRestTableViewCell
            
            cell.mainLabel.text = "Availability Calendar"
            cell.subLabel.text = ""
            return cell
            
            
        }else if arrayOfNumberOfRow[indexPath.row] == 12 {
            
            let cell = Bundle.main.loadNibNamed("BookingRestTableViewCell", owner: self, options: nil)?.first as! BookingRestTableViewCell
            
            cell.mainLabel.text = "Contact Host"
            cell.subLabel.text = ""
            return cell
            
            
        } else {
      
            let cell = Bundle.main.loadNibNamed("BookingMinimumStayTableViewCell", owner: self, options: nil)?.first as! BookingMinimumStayTableViewCell

            return cell
            
        }
        
       
    }

}

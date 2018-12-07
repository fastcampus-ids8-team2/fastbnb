//
//  GuestViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 27/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
//
//protocol  {
//    <#requirements#>
//}

class GuestViewController: UIViewController {

    @IBOutlet weak var adultPlusButton: UIButton!
    @IBOutlet weak var adultMinusButton: UIButton!
    @IBOutlet weak var childrenPlusButton: UIButton!
    @IBOutlet weak var childrenMinusButton: UIButton!
    @IBOutlet weak var infantPlusButton: UIButton!
    @IBOutlet weak var infantMinusButton: UIButton!
    
    @IBOutlet private weak var adultNumberLable: UILabel!
    @IBOutlet private weak var childrenNumberLable: UILabel!
    @IBOutlet private weak var infantNumberLable: UILabel!
    
    var adultLabelNumber = 1
    var childrenLabelNumber = 0
    var infantLabelNumber = 0
    
    var arrayOfCellData: Listing = []
    var arrayOfNewData: Listing = []
    
    
    @IBOutlet weak var masterGuestView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        arrayOfCellData = ListingData.shared.arrayOfCellData
        masterViewSetUp()
        
        
    
        
        
        
        
     
    }
    
    // Mark: showButton for the result search

    @IBAction func showResultsButtonTap(_ sender: Any) {
        
//        for i in 0...arrayOfCellData.count {
//            if adultLabelNumber >= arrayOfCellData[i].personCapacity {
//                arrayOfNewData.append(arrayOfCellData[i])
//                
//            }
//        }
//        
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    private func masterViewSetUp() {
        masterGuestView.layer.cornerRadius = 10
        masterGuestView.layer.masksToBounds = true
    }
    
    
    
    // Mark: Plus and minus Button has tapped to increase and decrease the number
    @IBAction func plusButtonTaped(_ sender: UIButton) {
        
        adultLabelNumber += 1
        adultNumberLable.text = "\(adultLabelNumber)"
        
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        
        if adultLabelNumber == 1 {
            adultNumberLable.text = "\(adultLabelNumber)"
        } else {
        adultLabelNumber -= 1
        adultNumberLable.text = "\(adultLabelNumber)"
        }
    }
    
    
    @IBAction func childrenPlusButtonTapped(_ sender: UIButton) {
        childrenLabelNumber += 1
        childrenNumberLable.text = "\(childrenLabelNumber)"
    }
    
    @IBAction func childrenMinusButtonTapped(_ sender: UIButton) {
        if childrenLabelNumber == 0 {
            childrenNumberLable.text = "\(childrenLabelNumber)"
        } else {
            childrenLabelNumber -= 1
            childrenNumberLable.text = "\(childrenLabelNumber)"
        }
        
    }
    
    @IBAction func infantPlusButtonTapped(_ sender: UIButton) {
        infantLabelNumber += 1
        infantNumberLable.text = "\(infantLabelNumber)"
        
    }
    
    @IBAction func infantMinusButtonTapped(_ sender: UIButton) {
        if infantLabelNumber == 0 {
            infantNumberLable.text = "\(infantLabelNumber)"
        } else {
            infantLabelNumber -= 1
            infantNumberLable.text = "\(infantLabelNumber)"
        }
        
    }
    
    
}

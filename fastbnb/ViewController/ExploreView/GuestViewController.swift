//
//  GuestViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 27/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

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
    
    
    
    @IBOutlet weak var masterGuestView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        masterViewSetUp()
    
        
        
        
        
     
    }
    

    @IBAction func showResultsButtonTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    private func masterViewSetUp() {
        masterGuestView.layer.cornerRadius = 10
        masterGuestView.layer.masksToBounds = true
    }
    
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

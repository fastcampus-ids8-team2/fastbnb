//
//  BookingConfirmationViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 16/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import Lottie


class BookingConfirmationViewController: UIViewController {

    @IBOutlet weak private var animationView: LOTAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()

    animationForConfirmation()
        
    }
    
    private func animationForConfirmation() {
        animationView.setAnimation(named: "christmas_tree_with_gift_boxes")
        animationView.loopAnimation = true
        animationView.play()
    }
    
    

    @IBAction func didTapBookingConfirmation(_ sender: UIButton) {
        
        let ExploreVC = storyboard?.instantiateViewController(withIdentifier: "ExploreViewController") as! ExploreViewController

        
        navigationController?.pushViewController(ExploreVC, animated: true)
    }

}

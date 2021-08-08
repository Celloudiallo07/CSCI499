//
//  InterestViewController.swift
//  Meal It
//
//  Created by David Luo on 6/23/21.
//

import UIKit

class InterestViewController: UIViewController {

    @IBOutlet weak var BeginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BeginButton.layer.cornerRadius = 10
        BeginButton.layer.shadowColor = UIColor.darkGray.cgColor
        BeginButton.layer.shadowRadius = 4
        BeginButton.layer.shadowOpacity = 0.6
        
    }

}

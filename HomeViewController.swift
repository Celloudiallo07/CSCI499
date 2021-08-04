//
//  HomeViewController.swift
//  Meal It
//
//  Created by David Luo on 6/17/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.backgroundColor = UIColor.green
        loginButton.layer.cornerRadius = 10
        loginButton.layer.shadowColor = UIColor.darkGray.cgColor
        loginButton.layer.shadowRadius = 4
        loginButton.layer.shadowOpacity = 0.6
        
        SignUpButton.backgroundColor = UIColor.systemBlue
        SignUpButton.layer.cornerRadius = 10
        SignUpButton.layer.shadowColor = UIColor.darkGray.cgColor
        SignUpButton.layer.shadowRadius = 4
        SignUpButton.layer.shadowOpacity = 0.6
    }
    

}

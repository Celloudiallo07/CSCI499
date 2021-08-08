//
//  NewDashboardViewController.swift
//  Meal It
//
//  Created by user201339 on 8/3/21.
//

import UIKit
import SwiftUI

    

class NewDashboardViewController: UIViewController {
    @IBOutlet weak var container : UIView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
        let childView = UIHostingController(rootView: HomeView())
        addChild(childView)
            childView.view.frame = container.bounds
            container.addSubview(childView.view)
        
    }


}

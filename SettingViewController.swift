//
//  SettingViewController.swift
//  Meal It
//
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var YoutubeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
        tabBarController?.tabBar.isHidden = true
        logOutButton.backgroundColor = UIColor.systemRed
        logOutButton.layer.cornerRadius = 10
        logOutButton.layer.shadowColor = UIColor.darkGray.cgColor
        logOutButton.layer.shadowRadius = 4
        logOutButton.layer.shadowOpacity = 0.6
        
        YoutubeButton.backgroundColor = UIColor.systemRed
        YoutubeButton.layer.cornerRadius = 10
        YoutubeButton.layer.shadowColor = UIColor.darkGray.cgColor
        YoutubeButton.layer.shadowRadius = 4
        YoutubeButton.layer.shadowOpacity = 0.6
    }
    
    
    @IBAction func onClickTabBar(_ sender: UIButton){
        
        let tag = sender.tag
        
        if tag == 1{
         
            tabBarController?.selectedIndex = 0
        }
        
        else if tag == 2{
            tabBarController?.selectedIndex = 1
        }
        
        else if tag == 3{
            tabBarController?.selectedIndex = 2
        }
        
        else if tag == 0{
            tabBarController?.selectedIndex = 3
        }
        
    }
    
    

    @IBAction func onClickAbout(_ sender: UIButton){
        performSegue(withIdentifier: "About", sender: nil)
    }
   
    @IBAction func onClickResource(_ sender: UIButton){
        performSegue(withIdentifier: "Resource", sender: nil)
    }
    
    @IBAction func onClickPrivacy(_ sender: UIButton){
        performSegue(withIdentifier: "Privacy", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

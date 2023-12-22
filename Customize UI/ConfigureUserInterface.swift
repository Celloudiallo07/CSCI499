//  ConfigureUserInterface.swift


import Foundation
import UIKit

public class ConfigureUserInterface: NSObject{
    public static func configureNavigationBar(navBar : UINavigationBar){
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        navBar.backgroundColor = UIColor.clear
    }
}

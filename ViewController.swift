//
//  ViewController.swift
//  Meal It
//
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        blurView.layer.cornerRadius = 25
        blurView.layer.masksToBounds = true

//        logoTopConstraint.constant = 120


//       let value = UserDefaults.standard.dictionary(forKey: "PERSONAL")
//
//        ageTF.text = value?["age"]  as? String
//        passwordTF.text = value?["fav"]  as? String
        NextButton.layer.cornerRadius = 10
        NextButton.layer.shadowColor = UIColor.darkGray.cgColor
        NextButton.layer.shadowRadius = 4
        NextButton.layer.shadowOpacity = 0.6
       
        setUpElements()
    }
    
    func setUpElements() {
    
        // Hide the error label
        errorLabel.alpha = 0
        NextButton.alpha = 0
    }
    
    @IBAction func LoginTapped(_ sender: Any) {
//        let dict  = ["email": EmailTF.text,
//                     "age":ageTF.text,
//                     "fav":passwordTF.text]
//
//        UserDefaults.standard.set(dict, forKey: "PERSONAL")
        
        // Create cleaned versions of the text field
        let email = EmailTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        // Signing in the user using firebase
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // Show error when error occurs
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
                self.NextButton.alpha = 0
                
//                self.showError("Account not found, please make sure your email and password are correct");
            }
            else {
//                let homeViewController = self.storyboard?.instantiateViewController(identifier: SelectController.Storyboard.interestViewController) as? InterestViewController
//
//                self.view.window?.rootViewController = homeViewController
//                self.view.window?.makeKeyAndVisible()
                self.errorLabel.alpha = 0
                self.NextButton.alpha = 1
            }
        }
    }
}


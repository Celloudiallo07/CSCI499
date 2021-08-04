//
//  SignUpViewController.swift
//  Meal It
//
//  Created by David Luo on 6/17/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SignUpButton.backgroundColor = UIColor.blue
        SignUpButton.layer.cornerRadius = 10
        SignUpButton.layer.shadowColor = UIColor.darkGray.cgColor
        SignUpButton.layer.shadowRadius = 4
        SignUpButton.layer.shadowOpacity = 0.6
        setUpElements()
    }
    
    func setUpElements() {
        // Hide the error label
        errorLabel.alpha = 0
    
    }
    
    func validCheck() -> String? {
        
        // Check that all fields are filled in
        if firstNameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields, no empty fields allowed."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Check.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
    }
    
    
    @IBAction func SignUpTapped(_ sender: Any) {
        // Validate the fields
        let error = validCheck()

        if error != nil {

            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {

            // Create cleaned versions of the data
            let firstName = firstNameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in

                // Check for errors
                if err != nil {

                    // There was an error creating the user
                    self.showError("Please enter a valid email")
                }
                else {

                    // User was created successfully, now stores the first name and last name
                    let db = Firestore.firestore()

                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in

                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                        else {
                            let homeViewController = self.storyboard?.instantiateViewController(identifier: SelectController.Storyboard.homeViewController) as? HomeViewController
                            
                            self.view.window?.rootViewController = homeViewController
                            self.view.window?.makeKeyAndVisible()
                        }
                    }
                }

            }
        }

    }
    
    // error show function
    func showError(_ message:String) {

        errorLabel.text = message
        errorLabel.alpha = 1
    }

}

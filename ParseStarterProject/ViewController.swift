/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {

    @IBAction func logOut() {
    
    }
    
    var signUpMode = true
    var activityIndicator = UIActivityIndicatorView()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var signUpOrLogIn: UIButton!
    @IBOutlet weak var changeSignupMode: UIButton!
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signupOrLogin(_ sender: Any) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            createAlert(title: "Error in form", message: "Please enter an email and password")
        } else {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            // UIApplication.shared() is now UIApplication.shared
            
            if signUpMode {
                // Sign Up
                let user = PFUser()
                user.username = emailTextField.text
                user.email = emailTextField.text
                user.password = passwordTextField.text
                
                user.signUpInBackground(block: { (success, error) in
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents() // UIApplication.shared() is now  UIApplication.shared
                    if error != nil {
                        var displayErrorMessage = "Please Try Again Later"
                        let error = error as NSError?
                        if let errorMessage = error?.userInfo["error"] as? String  {
                            displayErrorMessage = errorMessage
                        }
                        self.createAlert(title: "Signup Error", message: displayErrorMessage)
                    } else {
                        print("user signed up")
                        self.performSegue(withIdentifier: "showHotelTable", sender: self)
                    }
                })
            } else {
                // Log IN
                PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!, block: { (success, error) in
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents() // UIApplication.shared() is now  UIApplication.shared
                    if error != nil {
                        var displayErrorMessage = "Please Try Again Later"
                        let error = error as NSError?
                        if let errorMessage = error?.userInfo["error"] as? String  {
                            displayErrorMessage = errorMessage
                        }
                        self.createAlert(title: "Log In Error", message: displayErrorMessage)
                    } else {
                        print("Logged In")
                        self.performSegue(withIdentifier: "showHotelTable", sender: self)
                    }
                })
            }
        }
    }
    
    @IBAction func changeSignupMode(_ sender: Any) {
        
        if signUpMode {
            // Change to Login Mode
            signUpOrLogIn.setTitle("Log In", for: [])
            changeSignupMode.setTitle("Sign Up", for: [])
            messageLabel.text = "Don't have an account?"
            signUpMode = false
        } else {
            // Change to Sign Up Mode
            signUpOrLogIn.setTitle("Sign Up", for: [])
            changeSignupMode.setTitle("Log In", for: [])
            messageLabel.text = "Already have an account?"
            signUpMode = true
        }
    }
    
    // Already Logged In
    override func viewDidAppear(_ animated: Bool) {
        
        if PFUser.current() != nil {
            performSegue(withIdentifier: "showHotelTable", sender: self)
        }
        
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

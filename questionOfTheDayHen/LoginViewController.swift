//
//  LoginViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/2/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
logInButtonOutlet.isEnabled = false
}
    func correctInfo()
    {
        let email = emailTextField.text
        
        if (email == "")  {
            logInButtonOutlet.isEnabled = false
        }
        if email != "" {
            logInButtonOutlet.isEnabled = false
        }
        if email == "" {
            logInButtonOutlet.isEnabled = false
        }
        if email != ""  {
            logInButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func emailEdit(_ sender: UITextField) {
        correctInfo()
    }
    
    @IBAction func passwordEdit(_ sender: UITextField) {
        correctInfo()
    }
    @IBAction func logInButton(_ sender: UIButton)
    {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: "") { (authResult, error) in
            guard (authResult?.user) != nil
            else {
                return
            }
            self.dismiss(animated: true, completion: nil)
//            self.performSegue(withIdentifier: "segue", sender: UIButton())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segue" {
            let nvc = segue.destination as! ClassesViewController
            nvc.name = emailTextField.text!
        }
    }
}

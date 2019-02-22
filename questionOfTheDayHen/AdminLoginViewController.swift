//
//  AdminLoginViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/7/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AdminLoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func correctInfo()
    {
        var email = emailTextField.text
        var password = passwordTextField.text
        if (email == "") && password == ""
        {
            logInButtonOutlet.isEnabled = false
        }
        else if email != "" && password == ""
        {
            logInButtonOutlet.isEnabled = false
        }
        else if email == "" && password != ""
        {
            logInButtonOutlet.isEnabled = false
        }
        else if email != "" && password != ""
        {
            logInButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func passwordCorrectInfo(_ sender: UITextField) {
        correctInfo()
    }
    @IBAction func emailCorrectInfo(_ sender: UITextField) {
        correctInfo()
    }
    
    
    @IBAction func logInButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult, error) in
            guard (authResult?.user) != nil else {return}
            
            self.dismiss(animated: true, completion: nil)
//            self.performSegue(withIdentifier: "segue", sender: UIButton())
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

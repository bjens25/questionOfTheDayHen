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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

}
    
    @IBAction func logInButton(_ sender: UIButton)
    {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult, error) in
            guard (authResult?.user) != nil else {return}
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

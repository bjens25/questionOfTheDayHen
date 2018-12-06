//
//  SignUpViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/2/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpButtonOutlet: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()



}
    @IBAction func signIN(_ sender: UIButton) {
        var passwordOne = passwordTextField.text!
        var passwordTwo = confirmPasswordTextField.text!
        if passwordOne != passwordTwo
        {
        sender.isHidden = true
        }
        else
        {
            
        }
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!)
        {
            (authResult, error) in
            guard (authResult?.user) != nil else {return}
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    func hiddenButton()
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segue"
        {
            let nvc = segue.destination as! QuestionViewController
            nvc.email = emailTextField.text
        }
    }
}

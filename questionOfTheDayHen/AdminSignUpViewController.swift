//
//  AdminSignUpViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/7/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AdminSignUpViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signIN(_ sender: UIButton) {
        let passwordOne = passwordTextField.text!
        let passwordTwo = confirmPasswordTextField.text!
        if passwordOne != passwordTwo {
            sender.isHidden = true
        }else{
//            Auth.auth().createUser(withEmail: (emailTextField.text ?? ""), password: (passwordTextField.text ?? "")) { (result, error) in
//                if let _eror = error {
//                    //something bad happning
//                    print(_eror.localizedDescription )
//                }else{
//                    //user registered successfully
//                    print(result)
//                }
//            }
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) {
            (authResult, error) in
            guard (authResult?.user) != nil else {return}

            self.dismiss(animated: true, completion: nil)
            }
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

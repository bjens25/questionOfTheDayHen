//
//  ViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 10/30/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func action(_ sender: UIButton)
    {
        if segmentControl.selectedSegmentIndex == 0
        {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
                //
            }
        }
        else if segmentControl.selectedSegmentIndex == 1
        {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!)
            {
                (authResult, error) in
                guard let user = authResult?.user else {return}
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}


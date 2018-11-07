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
    @IBOutlet weak var adminSignUp: UIButton!
    @IBOutlet weak var adminLogin: UIButton!
    @IBOutlet weak var studentSignUp: UIButton!
    @IBOutlet weak var studentLogin: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        adminLogin.isHidden = true
        studentLogin.isHidden = false
        adminSignUp.isHidden = true
        studentSignUp.isHidden = false
    }

}


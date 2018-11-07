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
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var adminLogin: UIButton!
    @IBOutlet weak var studentSignUP: UIButton!
    @IBOutlet weak var studentLogin: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func student_AdminSegmented(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            adminLogin.isHidden = true
            studentLogin.isHidden = false
            adminSignUp.isHidden = true
            studentSignUP.isHidden = false
        case 1:
            adminLogin.isHidden = false
            studentLogin.isHidden = true
            adminSignUp.isHidden = false
            studentSignUP.isHidden = true
        default:
            break;
        }

    }
    //  @IBAction func action(_ sender: UIButton)
//    {
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adminLogin.isHidden = true
        studentLogin.isHidden = false
        adminSignUp.isHidden = true
        studentSignUP.isHidden = false
    }

}


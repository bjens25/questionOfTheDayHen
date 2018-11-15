//
//  AdminQuestionViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/8/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class AdminQuestionViewController: UIViewController {
    
    @IBOutlet weak var adminQuestion: UITextField!
    @IBOutlet weak var adminA: UITextField!
    @IBOutlet weak var adminB: UITextField!
    @IBOutlet weak var adminC: UITextField!
    @IBOutlet weak var adminD: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func publishToClassOnTap(_ sender: UIButton)
    {
        var answerA = adminA.text
        var answerB = adminB.text
        var answerC = adminC.text
        var answerD = adminD.text
        
        let db = Firestore.firestore()
        db.collection("answerChoices").document("answerChoices").setData([
            "A": answerA,
            "B": answerB,
            "C": answerC,
            "D": answerD
        ]) {(error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("something not right")
            }else{
                print("Document was successfully created and written.")
            }
        }

        
        }
    

 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

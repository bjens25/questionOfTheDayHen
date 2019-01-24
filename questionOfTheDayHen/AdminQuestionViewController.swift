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
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
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
db.collection("answerChoices").document("A").setData(["A": answerA
        ]) {(error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("something not right")
            }else{
                print("Document was successfully created and written.")
            }
        }
db.collection("answerChoices").document("B").setData(["B": answerB]) {(error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("something not right")
            }else{
                print("Document was successfully created and written.")
            }
        }
db.collection("answerChoices").document("C").setData(["C": answerC
        ]) {(error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("something not right")
            }else{
                print("Document was successfully created and written.")
            }
        }
db.collection("answerChoices").document("D").setData(["D": answerD
        ]) {(error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("something not right")
            }else{
                print("Document was successfully created and written.")
            }}
db.collection("question").document("question").setData(["question" :adminQuestion.text])
        {(error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("something not right")
            }else{
                print("Document was successfully created and written.")
            }
        }
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            db.collection("answerChoices").document("correctAnswer").setData(["A": answerA
                ])
        case 1:
            db.collection("answerChoices").document("correctAnswer").setData(["B": answerB
                ]);
        case 2:
                db.collection("answerChoices").document("correctAnswer").setData(["C": answerC]);
        case 3:
           db.collection("answerChoices").document("correctAnswer").setData(["D": answerD]) ;
        default:
            break
        }
    }
    @IBAction func updateAnswers(_ sender: UIButton) {
        segmentedControl.setTitle("\(adminA.text!)", forSegmentAt: 0)
        segmentedControl.setTitle("\(adminB.text!)", forSegmentAt: 1)
        segmentedControl.setTitle("\(adminC.text!)", forSegmentAt: 2)
        segmentedControl.setTitle("\(adminD.text!)", forSegmentAt: 3)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        var correctAnswer = "\(segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex))"
        if segue.identifier == "segue"
        {
            let nvc = segue.destination as! QuestionViewController
            nvc.answersArray = ["\(correctAnswer)"]
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



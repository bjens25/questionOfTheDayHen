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
    

    @IBOutlet weak var adminCorrect: UITextField!
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
        let answerA = adminA.text
        let answerB = adminB.text
        let answerC = adminC.text
        let answerD = adminD.text
        let correct = adminCorrect.text
        
        let db = Firestore.firestore()

        db.collection("answerChoices").document("A").setData(["A": answerA]) {(error: Error?) in
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
        db.collection("answerChoices").document("C").setData(["C": answerC]) {(error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("something not right")
            }else{
                print("Document was successfully created and written.")
            }
        }
        db.collection("answerChoices").document("D").setData(["D": answerD]) {(error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("something not right")
            }else{
                print("Document was successfully created and written.")
            }}
        db.collection("question").document("question").setData(["question" : adminQuestion.text]) {(error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("something not right")
            }else{
                print("Document was successfully created and written.")
            }
        }
        if correct == answerA {
            db.collection("correctAnswer").document("correctAnswer").setData(["correctAnswer" : correct
                ]) {(error: Error?) in
                if let error = error {
                    print("\(error.localizedDescription)")
                    print("something not right")
                }else{
                    print("Document was successfully created and written.")
                }
            }
        }
        if correct == answerB {
            db.collection("correctAnswer").document("correctAnswer").setData(["correctAnswer" : correct
                ]) {(error: Error?) in
                    if let error = error {
                        print("\(error.localizedDescription)")
                        print("something not right")
                    }else{
                        print("Document was successfully created and written.")
                    }
                }
        }
        if correct == answerC {
            db.collection("correctAnswer").document("correctAnswer").setData(["correctAnswer" : correct
                ]) {(error: Error?) in
                    if let error = error {
                        print("\(error.localizedDescription)")
                        print("something not right")
                    }else{
                        print("Document was successfully created and written.")
                    }
                }
            }
        if correct == answerD {
                db.collection("correctAnswer").document("correctAnswer").setData(["correctAnswer" : correct
                    ]) {(error: Error?) in
                        if let error = error {
                            print("\(error.localizedDescription)")
                            print("something not right")
                        }else{
                            print("Document was successfully created and written.")
                        }
                    }
            }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let nvc = segue.destination as! QuestionViewController
            for int in 0...100 {
                nvc.db.collection("responses").document("response\(int)").delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }}
                
            }
            for int in 1...100{
                nvc.db.collection("names").document("name\(int)").delete() { err in
                    if let err = err {
                        print("Error removing document: \(err)")
                    } else {
                        print("Document successfully removed!")
                    }}
            }
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




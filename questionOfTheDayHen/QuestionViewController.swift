//
//  QuestionViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/6/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import Firebase

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var optionA: UIButton!    
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    let db = Firestore.firestore()
    var answerAStore = String()
    @IBOutlet weak var adminCorrectAnswer: UILabel!
    
    var answersArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adminCorrectAnswer.text = "The Correct Answer Hasn't Been Determined."
        optionA.setTitle("Option A", for: .normal)
        optionB.setTitle("Option B", for: .normal)
        optionC.setTitle("Option C", for: .normal)
        optionD.setTitle("Option D", for: .normal)
        // Do any additional setup after loading the view.
        readA()
        readB()
        readC()
        readD()
        readQuestion()
    }

    @IBAction func onATapped(_ sender: UIButton) {
        answerLabel.text = "Answer: \(optionA.title(for: .normal)!)"
        answersArray.append("A: \(optionA.title(for: .normal)!)")
        if answersArray[0] == "A: \(optionA.title(for: .normal)!)"
        {
            adminCorrectAnswer.text = "A: \(optionA.title(for: .normal)!) is the Correct Answer."
        }
        db.collection("answerChoices").document("A")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
        }
    }
    @IBAction func onBTapped(_ sender: UIButton) {
        answerLabel.text = "Answer: \(optionB.title(for: .normal)!)"
        answersArray.append("B: \(optionB.title(for: .normal)!)")
        if answersArray[0] == "B: \(optionB.title(for: .normal)!)"
        {
            adminCorrectAnswer.text = "B: \(optionB.title(for: .normal)!) is the Correct Answer."
        }
        db.collection("answerChoices").document("B")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
        }
    }
    
    @IBAction func onCTapped(_ sender: UIButton) {
        answerLabel.text = "Answer: \(optionC.title(for: .normal)!)"
        answersArray.append("C: \(optionC.title(for: .normal)!)")
        if answersArray[0] == "C: \(optionC.title(for: .normal)!)"
        {
            adminCorrectAnswer.text = "C: \(optionC.title(for: .normal)!) is the Correct Answer."
        }
        db.collection("answerChoices").document("C")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
        }
    }
    
    @IBAction func onDTapped(_ sender: UIButton) {
        answerLabel.text = "Answer: \(optionD.title(for: .normal)!)"
        answersArray.append("D: \(optionD.title(for: .normal)!)")
        if answersArray[0] == "D: \(optionD.title(for: .normal)!)"
        {
            adminCorrectAnswer.text = "D: \(optionD.title(for: .normal)!) is the Correct Answer."
        }
        db.collection("answerChoices").document("D")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(data)")
        }
    }
    @IBOutlet weak var onSubmitTapped: UIButton!
    
func readA()
{
    let documentreference = db.collection("answerChoices").document("A")
    
    documentreference.getDocument { (document, error) in
        if let document = document, document.exists {
            let answerA = document.get("A")
            print("Document data: \(answerA)")
            self.optionA.setTitle(answerA as! String, for: .normal)
        } else {
            print("Document does not exist")
        }
        
    }    }

    func readB()
    {
        let documentreference = db.collection("answerChoices").document("B")
        
        documentreference.getDocument { (document, error) in
            if let document = document, document.exists {
                let answerB = document.get("B")
                print("Document data: \(answerB)")
                self.optionB.setTitle(answerB as! String, for: .normal)
            } else {
                print("Document does not exist")
            }
            
        }    }
    func readC()
    {
        let documentreference = db.collection("answerChoices").document("C")
        
        documentreference.getDocument { (document, error) in
            if let document = document, document.exists {
                let answerC = document.get("C")
                print("Document data: \(answerC)")
                self.optionC.setTitle(answerC as! String, for: .normal)
            } else {
                print("Document does not exist")
            }
            
        }    }
    func readD()
    {
        let documentreference = db.collection("answerChoices").document("D")
        
        documentreference.getDocument { (document, error) in
            if let document = document, document.exists {
                let answerD = document.get("D")
                print("Document data: \(answerD)")
                self.optionD.setTitle(answerD as! String, for: .normal)
            } else {
                print("Document does not exist")
            }
            
        }    }
    func readQuestion()
    {
        let documentreference = db.collection("question").document("question")
        
        documentreference.getDocument { (document, error) in
            if let document = document, document.exists {
                let question = document.get("question")
                print("Document data: \(question)")
                self.questionLabel.text = question as! String
            } else {
                print("Document does not exist")
            }
            
        }    }
    

}

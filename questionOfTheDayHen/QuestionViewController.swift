//
//  QuestionViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/6/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var optionA: UIButton!    
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    let db = Firestore.firestore()
    
    var theCorrectAnswer: String!
    var answersArray = [String]()
    var emailArray = [String]() 
    var email = String()
    var responseNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionA.setTitle("Option A", for: .normal)
        optionB.setTitle("Option B", for: .normal)
        optionC.setTitle("Option C", for: .normal)
        optionD.setTitle("Option D", for: .normal)
        readA()
        readB()
        readC()
        readD()
        readQuestion()
        readCorrectAnswer()
        readExistingAnswersArray()
//        answersArray.append(theCorrectAnswer)
    }

    @IBAction func onATapped(_ sender: UIButton) {
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
        answerLabel.text = "\(optionA.title(for: .normal)!)"
//        answersArray.append("A: \(optionA.title(for: .normal)!)")
//        if answersArray[0] == "A: \(optionA.title(for: .normal)!)"
//        {
//            adminCorrectAnswer.text = "A: \(optionA.title(for: .normal)!) is the Correct Answer."
//        }
    }
    @IBAction func onBTapped(_ sender: UIButton) {
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
        answerLabel.text = "Answer: \(optionB.title(for: .normal)!)"
        answerLabel.text = "\(optionB.title(for: .normal)!)"
//        if answersArray[0] == "B: \(optionB.title(for: .normal)!)"
//        {
//            adminCorrectAnswer.text = "B: \(optionB.title(for: .normal)!) is the Correct Answer."
//        }
    }
    
    @IBAction func onCTapped(_ sender: UIButton) {
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
        answerLabel.text = "Answer: \(optionC.title(for: .normal)!)"
        answerLabel.text = "\(optionC.title(for: .normal)!)"
//        if answersArray[0] == "C: \(optionC.title(for: .normal)!)"
//        {
//            adminCorrectAnswer.text = "C: \(optionC.title(for: .normal)!) is the Correct Answer."
//        }
    }
    
    @IBAction func onDTapped(_ sender: UIButton) {
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
        answerLabel.text = "Answer: \(optionD.title(for: .normal)!)"
        answerLabel.text = "\(optionD.title(for: .normal)!)"
//        if answersArray[0] == "D: \(optionD.title(for: .normal)!)"
//        {
//            adminCorrectAnswer.text = "D: \(optionD.title(for: .normal)!) is the Correct Answer."
//        }
    }

    
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
    func readCorrectAnswer()
    {
        let documentReference = db.collection("correctAnswer").document("correctAnswer")

        documentReference.getDocument { (document, error) in
            if let document = document, document.exists {
                let correctAnswer = document.get("correctAnswer")
                print("Document Data: \(correctAnswer)")
                self.answersArray.append(correctAnswer as! String)
                self.theCorrectAnswer = correctAnswer as! String
            } else {
                print("Document does not exist")
            }

    }
    
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "theSegue"
        {
            let nvc = segue.destination as! ResponsesViewController
            nvc.answers = answersArray
        }
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        answersArray.append(answerLabel.text!)
        var myAnswer = answerLabel.text
        print(answersArray)
        appendToFirebase()
        responseNumber += 1
        //is there an issue with redundancy?
        if myAnswer == theCorrectAnswer{
            print("Correct!")
        }
        else{
            print("Incorrect")
        }
        
    }

    func appendToFirebase(){
        for value in answersArray{
            let db = Firestore.firestore()
            db.collection("responses").document("response\(responseNumber)").setData([
                "response" : value
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

    func readExistingAnswersArray(){
        for int in 0 ... 100{
            //how can this be worked around? (that it can only take a certain number of responses)
            //also now will have to discard documents when new question presented?
            let documentreference = db.collection("responses").document("response\(int)")
            
            documentreference.getDocument { (document, error) in
                if let document = document, document.exists {
                    let response = document.get("response")
                    print("Document data: \(response)")
                    self.answersArray.append(response as! String)
                } else {
                    print("Document does not exist")
                }
                
            }
        }
    }

//
//    func alert()
//    {
//        let alert = UIAlertController(title: "We Need A Correct Answer", message: "Please select the option that is correct now.", preferredStyle: .alert)
//        let OKAction = UIAlertAction(title: "OK", style: .default)
//        alert.addAction(OKAction)
//        self.present(alert, animated: true, completion: nil)
//        }
    
}

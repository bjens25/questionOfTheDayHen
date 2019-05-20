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
    var namesArray = [String]()
    var name = String()
    var responseNumber = 0
    var nameNumber = 0
    
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
        readExistingNamesArray()
    }

    @IBAction func onATapped(_ sender: UIButton) {
        db.collection("answerChoices").document("A").addSnapshotListener { documentSnapshot, error in
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
        
    }}
    
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
            
        }}
    
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
            
        }}

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
            
        }}
    
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
            
        }}
    
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
    }}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segue"
        {
            let nvc = segue.destination as! ResponsesViewController
            nvc.answers = answersArray
            nvc.name = name
        }
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        answersArray.append(answerLabel.text!)
        namesArray.append(name)
        var myAnswer = answerLabel.text
        print(answersArray)
        appendToFirebase()
        responseNumber = answersArray.count
        nameNumber = answersArray.count
        if myAnswer == theCorrectAnswer{
            print("Correct!")
        }
        else{
            print("Incorrect")
        }
    }

    func appendToFirebase(){
        let db = Firestore.firestore()
        for value in answersArray {
            db.collection("responses").document("response\(responseNumber)").setData(["response" : value]) {(error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("something not right")
            }else{
                print("Document was successfully created and written.")
                }
            }}
        for value in namesArray{
            db.collection("names").document("name\(nameNumber)").setData(["name" : value]) {(error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
                print("something not right")
            }else{
                print("Document was successfully created and written.")
                }
            }}
    }

    func readExistingAnswersArray(){
        for int in 0 ... 100{
            let documentreference = db.collection("responses").document("response\(int)")
            
            documentreference.getDocument { (document, error) in
                if let document = document, document.exists {
                    let response = document.get("response")
                    print("Document data: \(response)")
                    self.answersArray.append(response as! String)
                } else {
                    print("Document does not exist")
                }
                
            }}}
    
    func readExistingNamesArray(){
        for int in 0 ... 100{
            let documentreference = db.collection("names").document("name\(int)")
            
            documentreference.getDocument { (document, error) in
                if let document = document, document.exists {
                    let aName = document.get("name")
                    print("Document data: \(aName)")
                    self.namesArray.append(aName as! String)
                } else {
                    print("Document does not exist")
                }
                
            }}}
}

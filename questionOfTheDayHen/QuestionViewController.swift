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
    override func viewDidLoad() {
        super.viewDidLoad()
        optionA.setTitle("Option A", for: .normal)
        optionB.setTitle("Option B", for: .normal)
        optionC.setTitle("Option C", for: .normal)
        optionD.setTitle("Option D", for: .normal)
        // Do any additional setup after loading the view.
    }

    @IBAction func onATapped(_ sender: UIButton) {
        answerLabel.text = "Answer: \(optionA.title(for: .normal)!)"
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
    }
    
    @IBAction func onCTapped(_ sender: UIButton) {
        answerLabel.text = "Answer: \(optionC.title(for: .normal)!)"
    }
    
    @IBAction func onDTapped(_ sender: UIButton) {
        answerLabel.text = "Answer: \(optionD.title(for: .normal)!)"
    }
    @IBOutlet weak var onSubmitTapped: UIButton!
    

}

//
//  QuestionViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/6/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var optionA: UIButton!    
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionA.setTitle("Option A", for: .normal)
        optionB.setTitle("Option B", for: .normal)
        optionC.setTitle("Option C", for: .normal)
        optionD.setTitle("Option D", for: .normal)
        // Do any additional setup after loading the view.
    }

    @IBAction func onATapped(_ sender: UIButton) {
    }

    @IBAction func onBTapped(_ sender: UIButton) {
    }
    
    @IBAction func onCTapped(_ sender: UIButton) {
    }
    
    @IBAction func onDTapped(_ sender: UIButton) {
    }
    @IBOutlet weak var onSubmitTapped: UIButton!
    

}

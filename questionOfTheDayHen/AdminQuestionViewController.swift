//
//  AdminQuestionViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/8/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

class AdminQuestionViewController: UIViewController {

    @IBOutlet weak var adminQuestion: UITextField!
    @IBOutlet weak var adminA: UITextField!
    @IBOutlet weak var adminB: UITextField!
    @IBOutlet weak var adminC: UITextField!
    @IBOutlet weak var adminD: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func publishToClassOnTap(_ sender: UIButton) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

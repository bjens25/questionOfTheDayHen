//
//  classCodeViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/5/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

class classCodeViewController: UIViewController {
    @IBOutlet weak var classCodeTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segue"
        {
            let nvc = segue.destination as! ClassesViewController
            nvc.classes.append(classCodeTextField.text!)
        }
    }
  

}

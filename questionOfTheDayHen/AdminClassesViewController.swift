//
//  AdminClassesViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/8/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

class AdminClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var adminClassesTableView: UITableView!
    var classes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func createNewClassAlert(_ sender: UIBarButtonItem) {
        alert()
    }
    
    func alert()
    {
        let alert = UIAlertController(title: "Add Class?", message: "Fill in the class name.", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {(action) in
            let classCodeTextField = alert.textFields![0] as UITextField
            let classCode = classCodeTextField.text
            self.classes.append(classCode!)
            self.adminClassesTableView.reloadData()
        }
        let cancelAction =  UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(OKAction)
        alert.addAction(cancelAction)
        alert.addTextField { (textField) in
            textField.placeholder = "Gift Idea"
        }
        present(alert, animated: true, completion: nil)
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

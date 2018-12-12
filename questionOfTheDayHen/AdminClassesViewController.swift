//
//  AdminClassesViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/8/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AdminClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var adminClassesTableView: UITableView!
    var classes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let theClass = classes[indexPath.row]
        cell?.textLabel?.text = theClass
        return cell!
    }
    
    @IBAction func createNewClassAlert(_ sender: UIBarButtonItem) {
        alert()
    }
    
    func correctAnswerWrite()
    {
        let db = Firestore.firestore()
        db.collection("answerChoices").document("correctAnswer").setData(["answersChoices": "correctAnswer"])
    }
    
    func alert()
    {
        let alert = UIAlertController(title: "Add Class?", message: "Fill in the class name.", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {(action) in
            let classCodeTextField = alert.textFields![0] as UITextField
            classCodeTextField.placeholder = "Class Code"
            let classNameTextField = alert.textFields![1] as UITextField
            classNameTextField.placeholder = "Class Name"
            let classCode = classCodeTextField.text
            let classTitle = classNameTextField.text
            let className = classNameTextField.text ?? "No Class Name" + "Class Code:" + classCode! ?? "No class code"
            self.classes.append(className)
            self.adminClassesTableView.reloadData()
            let db = Firestore.firestore()
            
            db.collection("classCodes").addDocument(data: [className: classCode!])
            
            db.collection("classCode").document(classCode!).setData([classTitle!: Auth.auth().currentUser?.email])
        }
        let cancelAction =  UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(OKAction)
        alert.addAction(cancelAction)
        alert.addTextField { (textField) in
            textField.placeholder = "Class Code"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Class Name"
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

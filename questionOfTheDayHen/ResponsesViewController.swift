//
//  ResponsesViewController.swift
//  
//
//  Created by period3 on 12/4/18.
//

import UIKit
import Firebase
import FirebaseFirestore

class ResponsesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    let db = Firestore.firestore()

    var isCorrect: Bool!
    var answers = [String]()
    var correctAnswers = [String]()
    var incorrectAnswers = [String]()
//    var defaults = UserDefaults.standard
//    var answer = String()
//
//        {
//        didSet
//        {
//            self.defaults.set(answers, forKey: answer)
//        }
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        if let saveData = defaults.object(forKey: answer) as? [String]
//        {
//            answers = saveData
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(answers)
        for answer in answers {
            if answers[0] == answer
            {
                isCorrect = true
                correctAnswers.append(answer)
            }
            else
            {
                isCorrect = false
                incorrectAnswers.append(answer)
            }
            

        }
    }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == self.tableView
        {
            return correctAnswers.count
        }
        else if tableView == self.tableView2
        {
            return incorrectAnswers.count
        }
        return Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let theAnswer = correctAnswers[indexPath.row]
            cell?.textLabel?.text = theAnswer
            cell?.detailTextLabel?.text = "Correct"
            return cell!
        }
        else if tableView == self.tableView2
        {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2")
            let theAnswer = incorrectAnswers[indexPath.row]
            cell2?.textLabel?.text = theAnswer
            cell2?.detailTextLabel?.text = "Incorrect"
            return cell2!
        }
        return UITableViewCell()
    }
    
    func readExistingAnswersArray(){
        for int in 0 ... 100{
        let documentreference = db.collection("responses").document("response\(int)")
        
        documentreference.getDocument { (document, error) in
            if let document = document, document.exists {
                let response = document.get("response")
                print("Document data: \(response)")
                self.answers.append(response as! String)
            } else {
                print("Document does not exist")
            }
            
        }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

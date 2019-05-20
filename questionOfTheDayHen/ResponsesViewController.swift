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
    var names = [String]()
    var correctNames = [String]()
    var incorrectNames = [String]()
    var name = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(answers)
        gradeAnswers()

    }
    
    func gradeAnswers()
    {
        for int in 0...answers.count - 1 {
            if answers[0] == answers[int]{
                isCorrect = true
                correctAnswers.append(answers[int])
                correctNames.append(names[int])
            }
            else {
                isCorrect = false
                incorrectAnswers.append(answers[int])
                incorrectNames.append(names[int])
                
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == self.tableView {
            return correctAnswers.count
        }
        else if tableView == self.tableView2 {
            return incorrectAnswers.count
        }
        return Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let theAnswer = correctAnswers[indexPath.row]
            let theName = correctNames[indexPath.row]
            cell?.textLabel?.text = theAnswer
            cell?.detailTextLabel?.text = theName
            return cell!
        }
        else if tableView == self.tableView2 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2")
            let theAnswer = incorrectAnswers[indexPath.row]
            let theName = incorrectNames[indexPath.row]
            cell2?.textLabel?.text = theAnswer
            cell2?.detailTextLabel?.text = theName
            return cell2!
        }
        return UITableViewCell()
    }
    
    func readExistingAnswersArray() {
        for int in 0 ... 100 {
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
            let documentreference2 = db.collection("names").document("name\(int)")
            
            documentreference2.getDocument { (document, error) in
                if let document = document, document.exists {
                    let aName = document.get("name")
                    print("Document data: \(aName)")
                    self.names.append(aName as! String)
                } else {
                    print("Document does not exist")
                }
                
            }
        }
    }
    func readExistingNamesArray(){
        
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

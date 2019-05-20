//
//  ClassesViewController.swift
//  questionOfTheDayHen
//
//  Created by period3 on 11/2/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit

class ClassesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var classes = ["First Class"]
    var name = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = classes[indexPath.row]
        return cell
    }
    
    @IBAction func logoutQuestion(_ sender: UIBarButtonItem) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segue" {
            let nvc = segue.destination as! QuestionViewController
            nvc.name = name
        }
    }
}

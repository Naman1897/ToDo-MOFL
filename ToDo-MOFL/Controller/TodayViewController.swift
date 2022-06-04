//
//  TodayViewController.swift
//  ToDo-MOFL
//
//  Created by Naman Singh on 04/06/22.
//

import UIKit

class TodayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addTaskPressed(_ sender: Any) {
        alertWithTF()
    }
    
   
    func alertWithTF() {
        //Step : 1
        let alert = UIAlertController(title: "Today's Task", message: "", preferredStyle: UIAlertController.Style.alert )
        //Step : 2
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            let textField2 = alert.textFields![1] as UITextField
            if textField.text != "" {
                //Read TextFields text data
                print(textField.text!)
                print("TF 1 : \(textField.text!)")
            } else {
                print("TF 1 is Empty...")
            }

            if textField2.text != "" {
                print(textField2.text!)
                print("TF 2 : \(textField2.text!)")
            } else {
                print("TF 2 is Empty...")
            }
        }

        //Step : 3
        //For first TF
        alert.addTextField { (textField) in
            textField.placeholder = "Task Name"
            textField.textColor = .red
        }
        //For second TF
        alert.addTextField { (textField) in
            textField.placeholder = "Task Details"
            textField.textColor = .blue
        }

        //Step : 4
        alert.addAction(save)
        //Cancel action
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (alertAction) in }
        alert.addAction(cancel)
        //OR single line action
        //alert.addAction(UIAlertAction(title: "Cancel", style: .default) { (alertAction) in })

        self.present(alert, animated:true, completion: nil)

    }

    
}

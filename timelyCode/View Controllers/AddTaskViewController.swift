//
//  AddTaskViewController.swift
//  timely
//
//  Created by user192427 on 3/25/21.
//

import UIKit

protocol AddTaskDelegate: class {
    func didCreate(_ task: Task)
}

class AddTaskViewController: UIViewController{
    weak var delegate: AddTaskDelegate?

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
    }

    @IBAction func CancelAddTask(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveTask(_ sender: UIBarButtonItem) {
        let c = createNewTask()
        if (c != nil) {
            //print("saving task")
            self.delegate?.didCreate(c!)
        }
        
    }
    
    
    func createNewTask() -> Task? {
        let t = titleField.text
        let d = descriptionField.text
        
        if ((t != nil) && (d != nil)) {
            return Task(title: t!, description: d!, isDone: false)
        } else {
            return nil
        }    }
}

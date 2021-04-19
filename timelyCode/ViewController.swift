//
//  ViewController.swift
//  timely
//
//  Created by user192427 on 3/24/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, AddTaskDelegate, completeTaskDelegate {


    private let table: UITableView = {
        let table = UITableView()
        //table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let textFieldCell = UINib(nibName: "ToDoCell",
                                  bundle: nil)
        table.register(textFieldCell,
                                forCellReuseIdentifier: "ToDoCell")
        return table
    }()
    
    var tasks = [Task]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Today"
        view.addSubview(table)
        table.dataSource = self
        //self.registerTableViewCells()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(tappedAdd))
    
    }
    
    @objc private func tappedAdd() {
        self.performSegue(withIdentifier: "SegueToAddTask", sender: self)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("in cell for row at")
        var currTask = tasks[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        //print(currTask.title + "\n" + currTask.description)
        if let taskTitle = cell.viewWithTag(1) as? UILabel {
            taskTitle.text = currTask.title
        }
        if let taskDescription = cell.viewWithTag(2) as? UILabel {
            taskDescription.text = currTask.description
        }
        
        let toggled :Bool = didToggle((cell.viewWithTag(3) as? CheckBox)!)
        
        if toggled {
            currTask.isDone = true;
        } else {
            currTask.isDone = false;
        }
        
        DispatchQueue.main.async {
            self.table.reloadData()
            
        }
        return cell 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let top = segue.destination as? UINavigationController {
            let atvc = top.topViewController as? AddTaskViewController
            atvc?.delegate = self
        }
        
    }
    func didCreate(_ task: Task) {
        //print("hello im in did create")
        
        dismiss(animated: true, completion: nil)
        tasks.append(task)
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    func didToggle(_ checkmark: CheckBox) -> Bool {
        //let cell = table.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        return checkmark.isSelected
    }
    
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "ToDoCell",
                                  bundle: nil)
        table.register(textFieldCell,
                                forCellReuseIdentifier: "ToDoCell")
    }
    
    // MARK: - Swipe to delete functionality
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // TODO: If the editing style is deletion, remove the newsItem from your model and then delete the rows. CAUTION: make sure you aren't calling tableView.reloadData when you update your model -- calling both tableView.deleteRows and tableView.reloadData will make the app crash.
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }}


//
//  ViewController.swift
//  timely
//
//  Created by user192427 on 3/24/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, AddTaskDelegate{

    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Today"
        view.addSubview(table)
        table.dataSource = self
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let top = segue.destination as? UINavigationController {
            let atvc = top.topViewController as? AddTaskViewController
            atvc?.delegate = self
        }
        
    }
    func didCreate(_ task: Task) {
        print("hello im in did create")
        
        dismiss(animated: true, completion: nil)
        DispatchQueue.main.async { self.table.reloadData() }
    }
    
}


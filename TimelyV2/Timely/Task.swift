//
//  Task.swift
//  Timely
//
//  Created by Allison Kim on 4/22/21.
//

import Foundation

struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String = ""
    var completed: Bool = false
    var dateCreated: Date = Date.init()
    
    var notes: String = ""
    var doDate: Date?
    var dueDate: Date?
    
    static let `default` = Task(title: "Get groceries", completed: false, dateCreated: Date.init(), notes: "Bananas, spam, oat milk", doDate: Date.init(), dueDate: Date.init())
}

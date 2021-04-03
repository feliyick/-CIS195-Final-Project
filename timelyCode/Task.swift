//
//  Task.swift
//  timely
//
//  Created by user192427 on 3/25/21.
//

import UIKit

struct Task {
    var title : String
    var description : String
    //var links : String
    var isDone : Bool
    //var dateAdded : String
    //var labels : [String]
    
    init(title: String, description: String, isDone: Bool) {
        self.title = title
        self.description = description
        self.isDone = false
    }
    /**init(title: String, description: String, links: String,
         isDone: String, dateAdded: String, labels: [String]) {
        self.title = title
        self.description = description
        self.links = links
        self.isDone = isDone
        self.dateAdded = dateAdded
        self.labels = labels
    }**/
    
 
}

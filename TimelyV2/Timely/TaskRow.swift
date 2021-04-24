//
//  TaskRow.swift
//  Timely
//
//  Created by Allison Kim on 4/22/21.
//

import SwiftUI

struct TaskRow: View {
    var task: Task
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }()
    
    var body: some View {
        HStack {
//            Button(action: { task.completed.toggle() }) {
                Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
//            }
            Text(task.title)
            task.doDate.map({Text(Self.dateFormatter.string(from: $0))
                                .font(.caption)
                                .foregroundColor(Color.gray)})
            Spacer()
            task.dueDate.map({Text(Self.dateFormatter.string(from: $0))
                                .font(.subheadline)
                                .foregroundColor(Color.red)})
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var doneTask = Task(title: "done task", completed: true)
    static var undoneTask = Task(title: "undone task", completed: false, doDate: Date.init(), dueDate: Date.init())
    
    static var previews: some View {
        TaskRow(task: doneTask)
            .previewLayout(.fixed(width: 300, height: 70))
        TaskRow(task: undoneTask)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}

//
//  TaskEdit.swift
//  Timely
//
//  Created by Allison Kim on 4/22/21.
//

import SwiftUI

struct NewTaskView: View {
//    @ObservedObject var projectViewModel: ProjectViewModel
    @Binding var tasks: [Task]
    @State var task: Task = Task()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "circle")
                
                VStack(alignment: .leading) {
                    TextField("New To-do", text: $task.title)
                    TextField("Notes", text: $task.notes)
                    
                    Spacer()
                    DatePicker(
                        "Do-Date",
                        selection: Binding<Date>(get: {self.task.doDate ?? Date()}, set: {self.task.doDate = $0}))
                    DatePicker(
                        "Deadline",
                        selection: Binding<Date>(get: {self.task.dueDate ?? Date()}, set: {self.task.dueDate = $0}))
                }
            }
            
            Button(action: addTask, label: {
                Text("Add task")
            })
            .padding()
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
    
    private func addTask() {
        self.tasks.append(task)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct NewTaskView_Previews: PreviewProvider {
    @State static var previewTasks: [Task] = []
    
    static var previews: some View {
        NewTaskView(tasks: $previewTasks)
            .previewLayout(.fixed(width: 400, height: 300))
        NewTaskView(tasks: $previewTasks, task: Task(title: "Get groceries", notes: "Bananas, oat milk"))
            .previewLayout(.fixed(width: 400, height: 300))
    }
}

//
//  EditTaskView.swift
//  Timely
//
//  Created by Allison Kim on 4/24/21.
//

import SwiftUI

struct EditTaskView: View {
    @Binding var task: Task
    
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
                }
            }
        }
        .padding()
    }
}

struct EditTaskView_Previews: PreviewProvider {
    @State static var previewTask: Task = Task(title: "Get groceries", notes: "Bananas, oat milk", doDate: Date.init(), dueDate: Date.init())
    
    static var previews: some View {
        EditTaskView(task: $previewTask)
    }
}

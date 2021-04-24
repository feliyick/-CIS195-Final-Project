//
//  ContentView.swift
//  Timely
//
//  Created by Allison Kim on 4/22/21.
//

import SwiftUI
import Combine

final class ModelData: ObservableObject {
    @Published var tasks: [Task] = []
}

struct ProjectView: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode
    @State private var showCreateTask = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(modelData.tasks) { task in
                    TaskRow(task: task)
                }
                
                Button(action: {
                    self.showCreateTask = true
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("New Task")
                    }
                }
                .padding()
            }
            .navigationTitle("Tasks")
            .sheet(isPresented: $showCreateTask) {
                NewTaskView(tasks: $modelData.tasks)
            }
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
            .environmentObject(ModelData())
    }
}

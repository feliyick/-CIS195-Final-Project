//
//  ProjectViewModel.swift
//  Timely
//
//  Created by Allison Kim on 4/23/21.
//

import Foundation
import Combine

class ProjectViewModel: ObservableObject {
    @Published var taskRepository = TaskRepository()
    
    func add(_ task: Task) {
        taskRepository.add(task)
    }
}

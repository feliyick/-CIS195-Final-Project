//
//  TimelyApp.swift
//  Timely
//
//  Created by Allison Kim on 4/22/21.
//

import SwiftUI
//import Firebase

@main
struct TimelyApp: App {
    @StateObject private var modelData = ModelData()
    
//    init() {
//        FirebaseApp.configure()
//    }
    
    var body: some Scene {
        WindowGroup {
            ProjectView()
                .environmentObject(modelData)
        }
    }
}

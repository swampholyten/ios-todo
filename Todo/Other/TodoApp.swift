//
//  TodoApp.swift
//  Todo
//
//  Created by junkai ji on 04/04/24.
//

import FirebaseCore
import SwiftUI

@main
struct TodoApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

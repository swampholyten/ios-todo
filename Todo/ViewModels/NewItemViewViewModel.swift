//
//  NewItemViewViewModel.swift
//  Todo
//
//  Created by junkai ji on 05/04/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    public func save() {
        guard canSave else {
            return
        }
        
//        Get current user id
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
//        Create Model
        let newID = UUID().uuidString
        let newItem = TodoListItem(id: newID,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
//        Save Model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
    
    
}

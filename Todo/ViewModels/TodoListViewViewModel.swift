//
//  TodoListViewViewModel.swift
//  Todo
//
//  Created by junkai ji on 05/04/24.
//
import FirebaseFirestore
import Foundation

class TodoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userID : String
    
    init(userID : String) {
        self.userID = userID
    }
    
    func delete(itemID: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(itemID)
            .delete()
    }
}

//
//  TodoListItemViewViewModel.swift
//  Todo
//
//  Created by junkai ji on 05/04/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TodoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: TodoListItem) {
        var itemRef = item
        itemRef.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemRef.id)
            .setData(itemRef.asDictionary())
    }
}

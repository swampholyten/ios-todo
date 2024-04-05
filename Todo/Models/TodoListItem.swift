//
//  TodoListItem.swift
//  Todo
//
//  Created by junkai ji on 04/04/24.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}

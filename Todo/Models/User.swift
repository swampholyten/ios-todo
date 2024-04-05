//
//  User.swift
//  Todo
//
//  Created by junkai ji on 04/04/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}

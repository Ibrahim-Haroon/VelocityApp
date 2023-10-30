//
//  ToDoListItem.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let difficulty: Double
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}

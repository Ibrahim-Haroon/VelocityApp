//
//  User.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/28/23.
//

import Foundation

struct User: Codable {
    let id: String;
    let name: String;
    let email: String;
    let joined: TimeInterval;
    var numTasksCompleted: Int;
}

//
//  Extensions.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/29/23.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        // if succesfully encoded object int o data
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]    // as? [String: Array] is casting
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

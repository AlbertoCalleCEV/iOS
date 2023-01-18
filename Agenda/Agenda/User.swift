//
//  User.swift
//  Agenda
//
//  Created by Apps2M on 13/1/23.
//

import Foundation

class User {
    var name: String
    var password: String
    
    init(json: [String: Any]) {
        name = json["user"] as? String ?? ""
        password = json["pass"] as? String ?? ""
    }
}

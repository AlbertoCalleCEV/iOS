//
//  DataManager.swift
//  Ejercicio12
//
//  Created by Apps2M on 1/12/22.
//

import Foundation

class DataManager {
    static var friends: [Friends] = []
    
    static func saveFriends() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(friends) {
            UserDefaults.standard.set(data, forKey: "friends")
        } else {
            print("Error in saving friends.")
        }
    }
    
    static func loadFriends() {
        let data = UserDefaults.standard.object(forKey: "friends")
        if data == nil {
            print("There are no saved data")
            return
        }
        let decoder = JSONDecoder()
        if let json = try? decoder.decode([Friends].self, from: data as! Data) {
            friends = json
        } else {
            print("Error in loading friends")
        }
    }
}

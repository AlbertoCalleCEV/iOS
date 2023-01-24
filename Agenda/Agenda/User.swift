//
//  User.swift
//  Agenda
//
//  Created by Apps2M on 13/1/23.
//

import Foundation

class User: Codable {
    var name: String
    
    init(nombre: String) {
        self.name = nombre
    }
    
    func saveUser() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self) {
            UserDefaults.standard.set(data, forKey: "user")
        }
        else {
            print("\n Error saving User \n")
        }
    }
    
    static func loadUser() -> User? {
        let data = UserDefaults.standard.object(forKey: "user")
        if data == nil {
            print("There are no saved data")
            return nil
        }
        let decoder = JSONDecoder()
        if let json = try? decoder.decode(User.self, from: data as! Data) {
//            name = json.name
            return json
        } else {
            print("\n Error in loading User \n")
            return nil
        }
    }
}

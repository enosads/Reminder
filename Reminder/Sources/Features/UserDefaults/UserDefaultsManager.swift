//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Enos Andrade on 08/11/25.
//

import Foundation

class UserDefaultsManager {
    private static let userKey = "userKey"
    
    static func saveUser(_ user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
        }
    }
    
    static func loadUser() -> User? {

        if let userData = UserDefaults.standard.data(forKey: userKey){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(User.self, from: userData) {
                return decoded
            }
        }
        return nil
    }
}

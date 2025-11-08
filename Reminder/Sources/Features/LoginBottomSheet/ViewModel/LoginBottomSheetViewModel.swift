//
//  LoginViewModel.swift
//  Reminder
//
//  Created by Enos Andrade on 24/10/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var successResult: ((String) -> Void)?

    func doAuth(usernameLogin:String, password:String) {
        print(usernameLogin, password)
        Auth.auth().signIn(withEmail: usernameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                print("Autenticação falhou \(error)")
            }else{
                self?.successResult?(usernameLogin)
            }
        }
    }
}

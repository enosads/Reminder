//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Enos Andrade on 15/10/25.
//

import Foundation

protocol LoginBottomSheetViewDelegate : AnyObject {
    func sendLoginData(user: String, password: String)
}

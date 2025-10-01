//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Enos Andrade on 30/09/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    let loginView = LoginBottomSheetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupConstraits()
    }
    
    private func setupConstraits() {
        self.view.addSubview(loginView)
    }
}

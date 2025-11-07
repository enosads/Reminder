//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Enos Andrade on 06/11/25.
//

import Foundation
import UIKit
 
class ReminderFlowController {
    //MARK: - Properties
    private var navigationController: UINavigationController?
    //MARK: - Splash
    //MARK: - Login
    //MARK: - init
    public init(){
        
    }
    // MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = SplashViewController()
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return self.navigationController
    }
}

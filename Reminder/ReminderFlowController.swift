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
    private let viewControllerFactory: ViewControllersFactoryProtocol
    
    //MARK: - init
    public init(){
        self.viewControllerFactory = ViewControllersFactory()
        
    }
    // MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = self.viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return self.navigationController
    }
}

//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true,)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottonSheet = self.viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottonSheet.modalPresentationStyle = .overCurrentContext
        loginBottonSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottonSheet, animated: false, ){
            loginBottonSheet.animateShow()
        }
    }
}

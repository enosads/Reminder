//
//  SplashViewController.swift
//  Reminder
//
//  Created by Enos Andrade on 27/09/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    public weak var flowDelegate: SplashFlowDelegate?
    let contentView: SplashView

    init(contentView: SplashView, flowDelegate: SplashFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // ciclo de decisão se vai para o login ou se vai pra home
        setup()
        setupGesture()
        startBreathAnimation()
    }

    private func decideNavigationFlow() {
        if let user = UserDefaultsManager.loadUser(), user.isUserSaved {
            flowDelegate?.navigateToHome()
        } else {
            showLoginBottomSheet()
        }
    }

    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Colors.primaryRedBase
        setupConstraints()

    }

    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(showLoginBottomSheet)
        )
        self.view.addGestureRecognizer(tapGesture)

    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc
    private func showLoginBottomSheet() {
        animateLogoUp()
        flowDelegate?.openLoginBottomSheet()
    }
}

// MARK: - Animations
extension SplashViewController {
    private func startBreathAnimation() {
        UIView.animate(
            withDuration: 1.5,
            delay: 0.0,
            animations: {
                self.contentView.logoImageView.transform = CGAffineTransform(
                    scaleX: 1.1,
                    y: 1.1
                )
            },
            completion: { _ in
                self.decideNavigationFlow()
            }
        )
    }

    private func animateLogoUp() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: [.curveEaseOut],
            animations: {
                self.contentView.logoImageView.transform = self.contentView
                    .logoImageView.transform.translatedBy(x: 0, y: -150)
            }
        )
    }
}

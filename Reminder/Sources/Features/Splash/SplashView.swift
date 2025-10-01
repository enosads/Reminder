//
//  SplashView.swift
//  Reminder
//
//  Created by Enos Andrade on 27/09/25.
//

import Foundation
import UIKit

class SplashView: UIView {

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

   
    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.backgroundColor = Colors.primaryRedBase
        addSubview(logoImageView)
        setupConstraits()
    }

    private func setupConstraits() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Metrics.medium),
        ])
    }
}

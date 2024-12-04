//
//  ThirdViewController.swift
//  Coordinator
//
//  Created by Arthur Sobrosa on 03/12/24.
//

import UIKit

class ThirdViewController: UIViewController {
    // MARK: - Coordinator
    
    weak var coordinator: Dismissing?
    
    // MARK: - UI Properties
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton(configuration: .bordered())
        button.setTitle("Dismiss", for: .normal)
        button.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Third"
        setupUI()
    }
    
    // MARK: - Methods
    
    @objc
    private func previousButtonTapped() {
        coordinator?.dismiss() /// call coordinator to navigate to second VC when button is tapped
    }
}

// MARK: - UI Setup

extension ThirdViewController {
    private func setupUI() {
        view.backgroundColor = .systemCyan
        view.addSubview(dismissButton)
        
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

//
//  SecondViewController.swift
//  Coordinator
//
//  Created by Arthur Sobrosa on 03/12/24.
//

import UIKit

class SecondViewController: UIViewController {
    // MARK: - Coordinator
    
    weak var coordinator: ShowingThirdVC?
    
    // MARK: - UI Properties
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(configuration: .bordered())
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Second"
        setupUI()
    }
    
    // MARK: - Methods
    
    @objc
    private func nextButtonTapped() {
        coordinator?.showThirdVC() /// call coordinator to navigate to third VC when button is tapped
    }
}

// MARK: - UI Setup

extension SecondViewController {
    private func setupUI() {
        view.backgroundColor = .systemGreen
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

//
//  FirstViewController.swift
//  Coordinator
//
//  Created by Arthur Sobrosa on 03/12/24.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: - Coordinator
    
    weak var coordinator: ShowingSecondVC? /// make coordinator conform only to the protocols that implement useful methods to the VC
    
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
        navigationItem.title = "First"
        setupUI()
    }
    
    // MARK: - Methods
    
    @objc
    private func nextButtonTapped() {
        coordinator?.showSecondVC() /// call coordinator to navigate to second VC when button is tapped
    }
}

// MARK: - UI Setup

extension FirstViewController {
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}


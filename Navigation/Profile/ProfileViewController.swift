//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Мария on 01.12.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {

    private let headerView = ProfileHeaderView()
    private var statusText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(headerView)
        title = "Profile"

        headerView.setStatusButton.addTarget(self, action: #selector(buttonPressed) , for: .touchUpInside)
        headerView.textField.addTarget(self, action: #selector(statusTextChanged) , for: .editingChanged )
        headerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func buttonPressed() {
        headerView.statusLabel.text = statusText
        headerView.endEditing(true)

    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "error"
        
    }

    }


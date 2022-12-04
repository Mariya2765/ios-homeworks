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
    }
    
    @objc private func buttonPressed() {
        headerView.statusLabel.text = statusText
        headerView.endEditing(true)

    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "error"
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = view.frame
        headerView.frame = .init(
            x: view.safeAreaInsets.left,
            y: view.safeAreaInsets.top,
            width: view.frame.width - view.safeAreaInsets.left - view.safeAreaInsets.right,
            height: 200
        )
    }
}

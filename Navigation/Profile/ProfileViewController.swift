//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Мария on 01.12.2022.
//

import Foundation
import UIKit

class ProfileViewController:
    UIViewController {

    private let header = ProfileHeaderView()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(header)
        title = "Profile"

        header.setStatusButton.addTarget(self, action: #selector(buttonPressed) , for: .touchUpInside)
        header.textField.addTarget(self, action: #selector(statusTextChanged) , for: .editingChanged )
    }

    @objc func buttonPressed() {
        header.statusLabel.text = statusText
        print(header.statusLabel.text ?? "not status")
    }
    private var statusText: String = ""
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "error"

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        header.frame = view.frame
        header.frame = .init(
            x: view.safeAreaInsets.left,
            y: view.safeAreaInsets.top,
            width: view.frame.width - view.safeAreaInsets.left - view.safeAreaInsets.right,
            height: 200)
    }
}

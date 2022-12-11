//
//  LogInViewController.swift
//  Navigation
//
//  Created by Мария on 09.12.2022.
//
import Foundation
import UIKit

class LogInViewController: UIViewController {
    private let logoView = LogInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logoView)
        logoView.logInButton.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
       
        logoView.translatesAutoresizingMaskIntoConstraints = false

        addConstraints()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            logoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            logoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func logInButtonAction() {

        let profileVc = ProfileViewController()
        navigationController?.pushViewController(profileVc, animated: true)

}

    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) else {return}
        self.logoView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 20, right: 0)

    }

    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.logoView.scrollView.contentInset = .zero
    }
}

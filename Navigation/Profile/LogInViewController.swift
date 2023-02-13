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
    
    var standartLogin = "1234"
    var standartPassword = "1234"
    
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
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // AlertController
    func presentAlertController() {
        let alertController = UIAlertController(title: "Внимание", message: "Неверный логин или пароль", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: { _ in print()}))
        alertController.addAction(.init(title: "cancel", style: .cancel))
        present(alertController, animated: true)
    }
    
    @objc private func logInButtonAction() {
        let profileVc = ProfileViewController()
        if logoView.loginTextField.text == standartLogin && logoView.passwordTextField.text == standartPassword {
            navigationController?.pushViewController(profileVc, animated: true)
        } else {
            presentAlertController()
        }
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 20, right: 0)
        self.logoView.scrollView.contentInset = insets
        self.logoView.scrollView.scrollIndicatorInsets = insets
        
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.logoView.scrollView.contentInset = .zero
        self.logoView.scrollView.scrollIndicatorInsets = .zero
    }
}


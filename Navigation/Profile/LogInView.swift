//
//  LogInView.swift
//  Navigation
//
//  Created by Мария on 09.12.2022.
//

import Foundation
import UIKit

protocol LogInViewDelegate: AnyObject {
//    func textFieldShouldReturn()

}


class LogInView: UIView {

    weak var delegate: LogInViewDelegate?
    private var pass = "123"
    private var loginText: String = ""
    private var passwordText: String = ""


    var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false

        return image

    }()

    let logInButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "blue_pixel")
        button.setBackgroundImage(image, for: .normal)
        // установка прозрачности в зависимости он положения
        button.setBackgroundImage(image?.imageWithAlpha(alpha: 0.8), for: .highlighted)
        button.setBackgroundImage(image?.imageWithAlpha(alpha: 0.8), for: .selected)
        button.setBackgroundImage(image?.imageWithAlpha(alpha: 0.8), for: .disabled)
        button.setBackgroundImage(image?.imageWithAlpha(alpha: 1), for: .normal)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false

        return button

    }()

    let loginTextField: UITextField = {
        let tfLogin = UITextField()

        tfLogin.backgroundColor = .systemGray6
        tfLogin.layer.borderColor = UIColor.lightGray.cgColor
        tfLogin.layer.borderWidth = 0.5
        tfLogin.layer.cornerRadius = 10
        tfLogin.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        tfLogin.font = .systemFont(ofSize: 16)
        tfLogin.textColor = .black
        tfLogin.autocapitalizationType = .none
        tfLogin.placeholder = "Email or phone"
        tfLogin.textAlignment = .left
        tfLogin.tintColor = UIColor(named: "My set")
        tfLogin.addTarget(self, action: #selector(tfLoginWasChanged), for: .editingChanged)
        tfLogin.tag = 1
        
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tfLogin.leftViewMode = .always
        tfLogin.leftView = spaceView
        tfLogin.translatesAutoresizingMaskIntoConstraints = false

        return tfLogin

    }()

    let passwordTextField: UITextField = {
        let tfPassword = UITextField()
        tfPassword.backgroundColor = .systemGray6
        tfPassword.layer.borderColor = UIColor.lightGray.cgColor
        tfPassword.layer.borderWidth = 0.5
        tfPassword.layer.cornerRadius = 10
        tfPassword.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tfPassword.font = .systemFont(ofSize: 16)
        tfPassword.textColor = .black
        tfPassword.tintColor = UIColor(named: "My set")
        tfPassword.autocapitalizationType = .none
        tfPassword.isSecureTextEntry = true
        tfPassword.placeholder = "Password"
        tfPassword.textAlignment = .justified
        tfPassword.addTarget(self, action: #selector(tfPasswordWasChanged), for: .editingChanged)
        tfPassword.tag = 1

        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tfPassword.leftViewMode = .always
        tfPassword.leftView = spaceView
        tfPassword.translatesAutoresizingMaskIntoConstraints = false

        return tfPassword

    }()

    // создание scrollView и contentView (оба обязательны для scrollView)
    let scrollView: UIScrollView = {
        var logScrollView = UIScrollView()
        logScrollView.keyboardDismissMode = .interactive
        logScrollView.backgroundColor = .white
        logScrollView.translatesAutoresizingMaskIntoConstraints = false

        return logScrollView

    }()

    let contentView: UIView = {
        var content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false

        return content

    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addElements()
        addConstraints()

    }
    // добавление элементов на View, scrollView, contentView
    func addElements() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(loginTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(logInButton)
        contentView.addSubview(logoImage)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // установка ограничений (констрейнтов)
    func addConstraints() {
        NSLayoutConstraint.activate([

            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),

            loginTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 340),
            loginTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            loginTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 170),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            logInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 236),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12) // обязательная привязка низа contentView
        ])
    }
    
    func configure(image: UIImage) {

        logoImage.image = image
    }

    

    @objc func tfLoginWasChanged() {
        loginText = loginTextField.text ?? "error"
    }

    @objc func tfPasswordWasChanged() {
        passwordText = passwordTextField.text ?? "error"
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if passwordTextField.tag == 1 {
            if (passwordTextField.text != pass) {

                passwordTextField.shakeLogin()
            }
        } else {
//                let isValid = loginTextField.text?.isValidEmail() ?? false
                passwordTextField.shakeLogin()
        }

return false
}

}

extension UITextField {
    func shakeLogin() {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 6
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = CGPoint(x: self.center.x - 4, y: self.center.y)
        shakeAnimation.toValue = CGPoint(x: self.center.x + 4, y: self.center.y)
        layer.add(shakeAnimation, forKey: "position")
    }
}

// функция для изменения картинки прозрачности
extension UIImage {
    func imageWithAlpha(alpha: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

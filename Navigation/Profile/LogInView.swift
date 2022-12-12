//
//  LogInView.swift
//  Navigation
//
//  Created by Мария on 09.12.2022.
//

import Foundation
import UIKit

class LogInView: UIView {

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
        switch button.state {
        case [.selected, .highlighted, .disabled]:
            button.alpha = 0.8
        default:
            button.alpha = 1
        }
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
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tfPassword.leftViewMode = .always
        tfPassword.leftView = spaceView
        tfPassword.translatesAutoresizingMaskIntoConstraints = false

        return tfPassword
    }()


    var scrollView: UIScrollView = {
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

//            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            scrollView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
//            scrollView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
//            scrollView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),

//            scrollView.heightAnchor.constraint(equalTo: self.heightAnchor),
//            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
//            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            scrollView.centerYAnchor.constraint(equalTo: self.centerYAnchor),


            loginTextField.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 340),
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
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
    }
        func configure(image: UIImage) {

            logoImage.image = image
        }
}

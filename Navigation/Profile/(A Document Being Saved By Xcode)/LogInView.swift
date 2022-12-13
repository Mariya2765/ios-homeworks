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
//        image.layer.borderWidth = 0.5
//        image.layer.borderColor = UIColor.lightGray.cgColor
//        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false

        return image

    }()

    let logInButton: UIButton = {
        let button = UIButton()
        //?? цвет как из сета??
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
   // 4 состояни кнопки
       // button.isSelected =

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
        tfLogin.text = "Email or phone"
        tfLogin.textAlignment = .left
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
        //tfPassword.tintColor = .acc - непонятно как
        tfPassword.autocapitalizationType = .none
        tfPassword.isSecureTextEntry = true
        tfPassword.text = "Password"
        tfPassword.textAlignment = .justified
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tfPassword.leftViewMode = .always
        tfPassword.leftView = spaceView
        
        tfPassword.translatesAutoresizingMaskIntoConstraints = false

        return tfPassword

    }()

    var scrollView: UIScrollView = {
    var logScrollView = UIScrollView()
        logScrollView.backgroundColor = .darkGray

        logScrollView.addSubview(loginTextField)

        return logScrollView

    }()





    override init(frame: CGRect) {
        super.init(frame: frame)


        addElements()
        addConstraints()
    }



    func addElements() {
        addSubview(logInButton)
        addSubview(logoImage)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(scrollView)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),

            loginTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            loginTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            loginTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            passwordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 170),
            passwordTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            logInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 236),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logInButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)


            ])
    }

        func configure(image: UIImage) {

            logoImage.image = image
        }

}


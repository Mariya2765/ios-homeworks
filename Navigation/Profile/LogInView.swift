//
//  LogInView.swift
//  Navigation
//
//  Created by Мария on 09.12.2022.
//

import Foundation
import UIKit

class LogInView: UIView, UITextFieldDelegate {

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

    lazy var loginTextField: UITextField = {
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
        tfLogin.delegate = self
        tfLogin.tag = 1
        
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tfLogin.leftViewMode = .always
        tfLogin.leftView = spaceView
        tfLogin.translatesAutoresizingMaskIntoConstraints = false

        return tfLogin

    }()

    lazy var passwordTextField: UITextField = {
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
        tfPassword.delegate = self
        tfPassword.addTarget(self, action: #selector(tfWasChanged), for: .editingChanged)
        tfPassword.tag = 2

        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tfPassword.leftViewMode = .always
        tfPassword.leftView = spaceView
        tfPassword.translatesAutoresizingMaskIntoConstraints = false

        return tfPassword

    }()

    let hiddenLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Количество символов меньше 5"
        textLabel.font = .systemFont(ofSize: 10)
        textLabel.textColor = .red
        textLabel.isHidden = true

        return textLabel

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
        contentView.addSubview(hiddenLabel)

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
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12), // обязательная привязка низа contentView

            hiddenLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 3),
            hiddenLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            hiddenLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(image: UIImage) {

        logoImage.image = image
    }

    @objc func tfWasChanged(_textField: UITextField) {
        let passwordTextCount = passwordTextField.text?.count
        if let tc = passwordTextCount {
            if tc < 5 {
                if tc == 0 {
                    hiddenLabel.isHidden = true
                } else {
                    hiddenLabel.isHidden = false
                }
                
            } else {
                hiddenLabel.isHidden = true
            }
        }

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.layer.backgroundColor = UIColor.clear.cgColor
        if textField.tag == 1 {
            let isValid = textField.text?.isValidEmail() ?? false
            print (isValid)
            if !isValid {
                textField.shakeLogin()
            }
        } else {
            textField.shakeLogin()
        }
        return false
    }
}

// анимация TextField при проверке на пустые поля
extension UITextField {
    func shakeLogin() {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.06
        shakeAnimation.repeatCount = 5
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

// для проверки валидности email

extension String {
    
    func isValidEmail() -> Bool {
        var state = 0 // переменная состояния
        var idx = 0 // индекс
        var ch: Character
        var mark = 0
        var local = ""
        
        var domain = [String]()
        
        // оформляем первую букву как "\0" и проверяем дальше
        while state != -1 && idx <= self.count {
            // условие выхода и прохождения через все буквы
            if idx == self.count {
                ch = "\0"
            } else {
                ch = self[idx]
                if ch == "\0" {
                    return false
                }
                
            }
            switch state{
            case 0:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9") || ch == "_" || ch == "-" || ch == "+") {
                    state = 1
                    break
                }
            case 1:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9") || ch == "_" || ch == "-" || ch == "+") {
                    break
                }
                if ch == "." {
                    state = 2
                    break
                }
                if ch == "@" {
                    local = self.subString(from: 0, to: idx - mark)
                    mark = idx + 1
                    state = 3
                    break
                }
                state = -1
            case 2:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9") || ch == "_" || ch == "-" || ch == "+") {
                    state = 1
                    break
                }
                state = -1
            case 3:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9")) {
                    state = 4
                    break
                }
                state = -1
            case 4:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9")) {
                    break
                }
                if ch == "-" {
                    state = 5
                    break
                }
                if ch == "." {
                    domain.append(self.subString(from: mark, to: idx))
                    mark = idx + 1
                    state = 5
                    break
                }
                if ch == "\0" {
                    domain.append(self.subString(from: mark, to: idx))
                    state = 6
                    break
                }
            case 5:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9")) {
                    state = 4
                    break
                }
                if ch == "." {
                    break
                }
                state = -1
            case 6:
                break
            default:
                break
            }
            idx += 1
            
        }
        if state != 6 {
            return false
        }
        if local.count > 64 {
            return false
        }
        if self.count > 254 {
            return false
        }
        
        idx = self.count - 1
        while idx > 0 {
            ch = self[idx]
            if ch == "." && self.count - idx > 2 {
                return true
            }
            if !((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")) {
                return false
            }
            idx -= 1
        }
        return true
    }
}

extension StringProtocol {
    
    subscript(offset: Int) -> Character {
        self[self.index(at: offset)]
    }
    
    //получаем индекс
    func subString(from: Int, to: Int) -> String {
        let startIndex = self.index(at: from)
        let endIndex = self.index(at: to)
        return String(self[startIndex..<endIndex])
    }
    
    func index(at offset: Int) -> String.Index {
        index(startIndex, offsetBy: offset)
    }
}

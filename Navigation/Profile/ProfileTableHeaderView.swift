//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Мария on 01.12.2022.
//

import Foundation
import UIKit

protocol ProfileHeaderViewDelegate: AnyObject {
    func dogImageViewTapped()
}

class ProfileHeaderView: UIView, UITextFieldDelegate {

    private let tapGestureRecognizer = UITapGestureRecognizer()

    weak var delegate: ProfileHeaderViewDelegate?

    private var statusText: String = ""

    private let backgroundView: UIView = {
        let deactiveView = UIView()
        deactiveView.frame = CGRect(x: 0, y: 0, width: 200, height: 500)
        deactiveView.backgroundColor = .systemGray
        deactiveView.alpha = 0
        deactiveView.translatesAutoresizingMaskIntoConstraints = false

        return deactiveView
    }()

    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "Waiting for something..."
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Set status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return button

    }()
    
    private lazy var textField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 12
        tf.font = .systemFont(ofSize: 15)
        tf.textColor = .black
        tf.textAlignment = .center
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addTarget(self, action: #selector(statusTextChanged) , for: .editingChanged )
        tf.delegate = self

        return tf
        
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Hipster Dog"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    lazy var dogImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "dog")
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 110 / 2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true

        return imageView
        
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        addElements()
        addConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageVisible() {
        dogImageView.isHidden = false
    }
    
    private func addElements() {
        addSubview(backgroundView)
        addSubview(profileLabel)
        addSubview(statusLabel)
        addSubview(dogImageView)
        addSubview(setStatusButton)
        addSubview(textField)
        dogImageView.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(handTapGesture))
    }
    
   private func addConstraints() {

        NSLayoutConstraint.activate([

            dogImageView.widthAnchor.constraint(equalToConstant: 110),
            dogImageView.heightAnchor.constraint(equalToConstant: 110),
            dogImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            dogImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),

            profileLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 150),
            profileLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            setStatusButton.topAnchor.constraint(equalTo: dogImageView.bottomAnchor, constant: 40),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
            statusLabel.bottomAnchor.constraint(equalTo: profileLabel.topAnchor, constant: 81),
            statusLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 150),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10),
            textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 150),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//            textField.shakeStatus()
//
//        return false
//    }

    private func configure(title: String, image: UIImage) {
        profileLabel.text = title
        dogImageView.image = image
    }

    @objc func handTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        dogImageView.isHidden = true
        delegate?.dogImageViewTapped()
    }

    @objc private func buttonPressed() {
        if statusText.count == 0 {
            textField.shakeStatus()
        } else {
            statusLabel.text = statusText
            
        }
        self.endEditing(true)
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "error"
    }
}

// анимация TextField при проверке на пустые поля
extension UITextField {
    func shakeStatus() {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.06
        shakeAnimation.repeatCount = 5
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = CGPoint(x: self.center.x - 4, y: self.center.y)
        shakeAnimation.toValue = CGPoint(x: self.center.x + 4, y: self.center.y)
        layer.add(shakeAnimation, forKey: "position")

    }
}

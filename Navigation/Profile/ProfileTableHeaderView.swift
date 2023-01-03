//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Мария on 01.12.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {

    private let tapGestureRecognizer = UITapGestureRecognizer()

    private var dogViewTopConstraint: NSLayoutConstraint!
    private var dogViewLeadingConstraint: NSLayoutConstraint!
    private var dogViewWidthConstraint: NSLayoutConstraint!

    private var dogViewCenterXconstraint: NSLayoutConstraint!
    private var dogViewCenterYconstraint: NSLayoutConstraint!
    private var widthToScreenConstraint: NSLayoutConstraint!

    private var statusText: String = ""


    private let backgroundView: UIView = {
        let deactiveView = UIView()
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
    
    var dogImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dog")
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 110 / 2
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
        
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
    
    func addElements() {
        addSubview(profileLabel)
        addSubview(statusLabel)
        addSubview(dogImageView)
        addSubview(setStatusButton)
        addSubview(textField)
        dogImageView.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(handTapGesture))
//        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handTapGesture)))
    }
    
    func addConstraints() {

        dogViewLeadingConstraint = dogImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16)
        dogViewTopConstraint = dogImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        dogViewWidthConstraint = dogImageView.widthAnchor.constraint(equalToConstant: 110)
        
        dogViewCenterXconstraint = dogImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        dogViewCenterYconstraint = dogImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        widthToScreenConstraint = dogImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -30)

        NSLayoutConstraint.activate([
            
            dogViewWidthConstraint,
            dogViewLeadingConstraint,
            dogViewTopConstraint,
            dogImageView.heightAnchor.constraint(equalTo: dogImageView.widthAnchor),
            
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
            textField.heightAnchor.constraint(equalToConstant: 40),

        ])
        
    }
    
    
    func configure(title: String, image: UIImage) {
        profileLabel.text = title
        dogImageView.image = image
    }

    @objc func handTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {

        
//        NSLayoutConstraint.deactivate([
//            dogViewWidthConstraint,
//            dogViewLeadingConstraint,
//            dogViewTopConstraint
//        ])
//
//        NSLayoutConstraint.activate([
//            dogViewCenterXconstraint,
//            dogViewCenterYconstraint,
//            widthToScreenConstraint
//        ])

        UIView.animate(withDuration: 1, delay: 0, animations: {
            self.layoutIfNeeded()
        })
    }
    
    @objc private func buttonPressed() {
        statusLabel.text = statusText
        self.endEditing(true)
        
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "error"
        
    }
}

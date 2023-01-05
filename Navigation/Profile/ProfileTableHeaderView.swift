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
    private var widthDogView: NSLayoutConstraint!

    private var backgroundViewTopConstraint: NSLayoutConstraint!
    private var backgroundViewBottomConstraint: NSLayoutConstraint!
    private var backgroundViewHeightConstraint: NSLayoutConstraint!
    private var backgroundViewWidthConstraint: NSLayoutConstraint!

    private var cancelButtonTopConstraint: NSLayoutConstraint!
    private var cancelButtonTrailingConstraint: NSLayoutConstraint!
    private var cancelButtonWidthConstraint: NSLayoutConstraint!
    private var cancelButtonHeightConstraint: NSLayoutConstraint!


    private var isBig = false

    private var statusText: String = ""

    private let cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        //button.tintColor = .black

        button.alpha = 1

        button.frame = CGRect(x: 400, y: 10, width: 10, height: 10)
       // button.imageView = UIImage(named: "clear")
        button.setImage(UIImage(systemName: "clear" ), for: .normal)

        return button
    }()


    private let backgroundView: UIView = {
        let deactiveView = UIView()
        deactiveView.frame = CGRect(x: 0, y: 0, width: 200, height: 500)
//        deactiveView.contentMode = .scaleAspectFit
        deactiveView.backgroundColor = .systemGray
        deactiveView.alpha = 0
        //deactiveView.backgroundColor = .systemMint.withAlphaComponent(0)
//        deactiveView.backgroundColor = .systemMint.withAlphaComponent(0.8)
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
    
    lazy var dogImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dog")
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 110 / 2
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true


        image.viewPrintFormatter()

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
        addSubview(backgroundView)
        addSubview(profileLabel)
        addSubview(statusLabel)
        addSubview(dogImageView)
        addSubview(setStatusButton)
        addSubview(textField)

        backgroundView.addSubview(cancelButton)
        // эти две строчки не работают почему-то
        dogImageView.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(handTapGesture))
        //dogImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handTapGesture)))

        //зато поменяла те строчки на эту - более-менее заработало
        //addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handTapGesture)))
    }
    
    func addConstraints() {

        dogViewLeadingConstraint = dogImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16)
        dogViewTopConstraint = dogImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        dogViewWidthConstraint = dogImageView.widthAnchor.constraint(equalToConstant: 110)
        
        dogViewCenterXconstraint = dogImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        dogViewCenterYconstraint = dogImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        widthToScreenConstraint = dogImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -5)
        widthDogView = dogImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)

//        backgroundViewLeadingConstraint = backgroundView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
//        backgroundViewTrailingConstraint = backgroundView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
//        backgroundViewTopConstraint = backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
//        backgroundViewBottomConstraint = backgroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
//
        cancelButtonTopConstraint = cancelButton.topAnchor.constraint(equalTo: backgroundView.topAnchor)
        cancelButtonTrailingConstraint = cancelButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor)
        cancelButtonWidthConstraint = cancelButton.widthAnchor.constraint(equalToConstant: 20)
        cancelButtonHeightConstraint = cancelButton.heightAnchor.constraint(equalToConstant: 20)

        backgroundViewTopConstraint = backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        backgroundViewBottomConstraint = backgroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        backgroundViewHeightConstraint = backgroundView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor)
        backgroundViewWidthConstraint = backgroundView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)

        NSLayoutConstraint.activate([

            dogViewWidthConstraint,
            dogViewLeadingConstraint,
            dogViewTopConstraint,
            dogImageView.heightAnchor.constraint(equalTo: dogImageView.widthAnchor),

            backgroundViewTopConstraint,
                            backgroundViewBottomConstraint,
                            backgroundViewHeightConstraint,
                            backgroundViewWidthConstraint,

            cancelButtonTopConstraint,
            cancelButtonTrailingConstraint,
            cancelButtonWidthConstraint,
            cancelButtonHeightConstraint,

            
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
    
    
    func configure(title: String, image: UIImage) {
        profileLabel.text = title
        dogImageView.image = image
    }

    @objc func handTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        if isBig {
//            NSLayoutConstraint.deactivate([
//                backgroundViewTopConstraint,
//                backgroundViewBottomConstraint,
//                backgroundViewHeightConstraint,
//                backgroundViewWidthConstraint
//                dogViewCenterXconstraint,
//                dogViewCenterYconstraint,
//                widthToScreenConstraint,
//                backgroundViewTopConstraint,
//                backgroundViewBottomConstraint,
//                backgroundViewLeadingConstraint,
//                backgroundViewTrailingConstraint,

//            ])
            NSLayoutConstraint.activate([
                cancelButtonTopConstraint,
                cancelButtonTrailingConstraint,
                cancelButtonWidthConstraint,
                cancelButtonHeightConstraint
//            widthDogView
//                dogViewWidthConstraint,
//                dogViewLeadingConstraint,
//                dogViewTopConstraint
            ])
//            print("yes")
        } else {
            NSLayoutConstraint.deactivate([
                cancelButtonTopConstraint,
                cancelButtonTrailingConstraint,
                cancelButtonWidthConstraint,
                cancelButtonHeightConstraint
//            widthDogView
//                dogViewWidthConstraint,
//                dogViewLeadingConstraint,
//                dogViewTopConstraint
            ])
//            NSLayoutConstraint.activate([
//                backgroundViewTopConstraint,
//                backgroundViewBottomConstraint,
//                backgroundViewHeightConstraint,
//                backgroundViewWidthConstraint
//                dogViewCenterXconstraint,
//                dogViewCenterYconstraint,
//                widthToScreenConstraint,
//                backgroundViewTopConstraint,
//                backgroundViewBottomConstraint,
//                backgroundViewLeadingConstraint,
//                backgroundViewTrailingConstraint,
////                cancelButtonTopConstraint,
////                cancelButtonTrailingConstraint,
////                cancelButtonWidthConstraint,
////                cancelButtonHeightConstraint
//            ])
        }
        isBig.toggle()
        UIView.animate(withDuration: 1) {

//            self.backgroundView.alpha = 0.5
//
//            self.backgroundView.center.y = UIScreen.main.bounds.height/2
//            self.backgroundView.center.x = UIScreen.main.bounds.width/2

//            self.backgroundView.contentMode = .center
//            backgroundView.transform = .

            self.dogImageView.layer.cornerRadius = 0

            self.dogImageView.center.y =  UIScreen.main.bounds.height/2
            self.dogImageView.center.x = UIScreen.main.bounds.width/2

//            self.backgroundView.backgroundColor = .systemGray.withAlphaComponent(0.8)
           // self.backgroundView.alpha = 6

            self.backgroundView.center.y =  UIScreen.main.bounds.height/2
            self.backgroundView.center.x = UIScreen.main.bounds.width/2
            self.backgroundView.alpha = 0.8

            self.cancelButton.backgroundColor = .systemGray.withAlphaComponent(0.8)
            

//            self.dogImageView.layer.cornerRadius = self.isBig
//                       ? 55
//                        : 0
//
//            self.backgroundView.alpha = self.isBig
//                       ? 0.8
//                        : 0
                       self.layoutIfNeeded()
                   }



        }


//        UIView.animate(withDuration: 1) {
//            self.dogImageView.layer.cornerRadius = self.isBig
//            ? 55
//             : 0
////            self.backgroundView.alpha = self.isBig
////            ? 0
////            : 1
////            self.layoutIfNeeded()
//        }


    
    @objc private func buttonPressed() {
        statusLabel.text = statusText
        self.endEditing(true)
        
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "error"
        
    }
}

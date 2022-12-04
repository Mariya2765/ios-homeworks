//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Мария on 01.12.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {

    let statusLabel = UILabel()
    let setStatusButton = UIButton()
    let textField = UITextField()
    private let profileLabel = UILabel()
    private let dogImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(profileLabel)
        profileLabel.font = .boldSystemFont(ofSize: 18)
        profileLabel.textColor = .black
        profileLabel.textAlignment = .left
        profileLabel.text = "Hipster Cat"


        addSubview(statusLabel)
        statusLabel.font = .systemFont(ofSize: 14)
        statusLabel.textColor = .gray
        statusLabel.textAlignment = .left
        statusLabel.text = "Waiting for something..."

        addSubview(dogImageView)
        dogImageView.image = UIImage(named: "dog")
        dogImageView.layer.borderWidth = 3
        dogImageView.layer.borderColor = UIColor.white.cgColor
        dogImageView.layer.cornerRadius = 55
        dogImageView.clipsToBounds = true

        addSubview(setStatusButton)
        setStatusButton.backgroundColor = UIColor.systemBlue
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.setTitleColor(.white, for: .normal)

        addSubview(textField)
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 12
        textField.font = .systemFont(ofSize: 15)
        textField.textColor = .black
        textField.textAlignment = .left
    }

    override func layoutSubviews() {
        profileLabel.frame = CGRect(x: 145, y: 27, width: frame.width - 16, height: 35)
        statusLabel.frame = CGRect(x: 145, y: 80, width: frame.width - 16, height: 15)
        dogImageView.frame = CGRect(x: 16, y: 16, width: 110, height: 110)
        setStatusButton.frame = CGRect(x: 16, y:  142, width: frame.width - 32, height: 50)
        textField.frame = CGRect(x: 145, y: 100, width: frame.width - 16 - 145 , height: 40)

    }

    func configure(title: String, image: UIImage) {
        profileLabel.text = title
        dogImageView.image = image
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
    let showStatusButton = UIButton()
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

        addSubview(showStatusButton)
        showStatusButton.backgroundColor = UIColor.systemBlue
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowColor = UIColor.black.cgColor

        showStatusButton.setTitleColor(.white, for: .normal)

    }

    override func layoutSubviews() {
        profileLabel.frame = CGRect(x: 145, y: 27, width: frame.width - 32, height: 35)
        statusLabel.frame = CGRect(x: 145, y: 94, width: frame.width - 32, height: 20)
        dogImageView.frame = CGRect(x: 16, y: 16, width: 110, height: 110)
        showStatusButton.frame = CGRect(x: 16, y:  142, width: frame.width - 32, height: 50)

    }

    func configure(title: String, image: UIImage) {
        profileLabel.text = title
        dogImageView.image = image
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

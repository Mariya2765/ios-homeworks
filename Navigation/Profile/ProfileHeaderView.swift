//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Мария on 01.12.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {

    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "Waiting for something..."
        
        return label
    }()
    
    let setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Set status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        
        return button
        
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 12
        tf.font = .systemFont(ofSize: 15)
        tf.textColor = .black
        tf.textAlignment = .center
        
        return tf
        
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Hipster Cat"
        
        return label
        
    }()
    
    private var dogImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dog")
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 55
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
        return image
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileLabel)
        addSubview(statusLabel)
        addSubview(dogImageView)
        addSubview(setStatusButton)
        addSubview(textField)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        profileLabel.frame = CGRect(x: 145, y: 27, width: frame.width - 16, height: 35)
        statusLabel.frame = CGRect(x: 145, y: 80, width: frame.width - 16, height: 15)
        dogImageView.frame = CGRect(x: 16, y: 16, width: 110, height: 110)
        setStatusButton.frame = CGRect(x: 16, y:  150, width: frame.width - 32, height: 50)
        textField.frame = CGRect(x: 145, y: 100, width: frame.width - 16 - 145 , height: 40)
        
    }
    
    func configure(title: String, image: UIImage) {
        profileLabel.text = title
        dogImageView.image = image
    }
    
    
}

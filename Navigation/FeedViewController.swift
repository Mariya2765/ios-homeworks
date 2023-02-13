//
//  ViewController.swift
//  Navigation
//
//  Created by Мария on 25.11.2022.
//

import UIKit


class FeedViewController: UIViewController {
    var post = Post(postID: 0, autor: "123", description: "14", image: "tree", likes: 3, views: 7)
    private let stackView = UIStackView()
    
    private let postButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Post", for: .normal)
        return button
    }()
    
    private let newPostButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 4
        button.setTitle("New post", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(postButton)
        stackView.addArrangedSubview(newPostButton)
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 120),
            stackView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}


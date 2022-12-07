//
//  ViewController.swift
//  Navigation
//
//  Created by Мария on 25.11.2022.
//

import UIKit


class FeedViewController: UIViewController {
    var post = Post(title: "Мой пост")
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
        postButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        newPostButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

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

    @objc private func buttonAction() {

        let postVc = PostViewController(post: self.post)
        navigationController?.pushViewController(postVc, animated: true)
    }
}


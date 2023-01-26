//
//  PostViewOnTapController.swift
//  Navigation
//
//  Created by Мария on 26.01.2023.
//


import Foundation
import UIKit

class PostViewOnTapController: UIViewController {
    private let postView = PostViewOnTap()
//    private var postID: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(postView)
        postView.translatesAutoresizingMaskIntoConstraints = false
        

        addConstraints()
    }
    func addConstraints() {
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func configure(post: Post) {

        postView.configure(post: post)

    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
       
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }

    
}

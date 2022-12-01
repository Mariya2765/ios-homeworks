//
//  PostViewController.swift
//  Navigation
//
//  Created by Мария on 26.11.2022.
//

import UIKit

class PostViewController: UIViewController {
    let post: Post
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.title = self.post.title

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(barButtonAction))
    }

    @objc func barButtonAction() {
        let infoVc = InfoViewController()
        present(infoVc, animated: true)
    }


}

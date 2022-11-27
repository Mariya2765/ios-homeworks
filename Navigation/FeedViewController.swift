//
//  ViewController.swift
//  Navigation
//
//  Created by Мария on 25.11.2022.
//

import UIKit


class FeedViewController: UIViewController {

    @objc func buttonAction() {

        let postVc = PostViewController(post: self.post)
        navigationController?.pushViewController(postVc, animated: true)
    }

    var post = Post(title: "Мой пост")

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidload 1")
        self.view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 60))
        button.backgroundColor = UIColor.green
        button.setTitle("Пост", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonAction) , for: .touchUpInside)
        self.view.addSubview(button)


        // self.createSecondNavigationController?.pushViewController(PostViewController, animated: true)
       // PostViewController.titlePost = post.title
    }




}


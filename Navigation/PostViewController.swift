//
//  PostViewController.swift
//  Navigation
//
//  Created by Мария on 26.11.2022.
//

import UIKit

class PostViewController: UIViewController {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(barButtonAction))
    }

    @objc private func barButtonAction() {
        let infoVc = InfoViewController()
        present(infoVc, animated: true)
    }


    
}

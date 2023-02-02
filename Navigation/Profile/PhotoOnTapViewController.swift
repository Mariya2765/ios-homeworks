//
//  PhotoOnTapViewController.swift
//  Navigation
//
//  Created by Мария on 30.01.2023.
//

import Foundation
import UIKit

class PhotoOnTapViewController: UIViewController {
    private let photoView = PostViewOnTap()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(photoView)
        photoView.translatesAutoresizingMaskIntoConstraints = false

        addConstraints()
    }
    func addConstraints() {
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

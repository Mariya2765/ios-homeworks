//
//  PhotoOnTapViewController.swift
//  Navigation
//
//  Created by Мария on 30.01.2023.
//

import Foundation
import UIKit

class PhotoOnTapViewController: UIViewController {
     let photoView = PhotoViewOnTap()
    
//сейчас конструктор создала для передачи фото в PhotosViewController
    private var arrayOfImages: [UIImage]
    
    init(array: [UIImage]) {
        self.arrayOfImages = array
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(photoView)
        photoView.translatesAutoresizingMaskIntoConstraints = false

        navigationItem.title = "Photo"

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

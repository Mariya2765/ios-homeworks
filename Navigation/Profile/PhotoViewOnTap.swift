//
//  PhotoViewOnTap.swift
//  Navigation
//
//  Created by Мария on 30.01.2023.
//

import Foundation
import UIKit

class PhotoViewOnTap: UIView {

    private var imageID: Int?

    private var arrayOfImages: [UIImage] = ImageProvider.getImages()

    private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMyView()
        addConstraints()
    }

    // Добавляем все элементы ячейки на contentView
    func setupMyView() {

        addSubview(imageView)

    }

    func addConstraints() {
        NSLayoutConstraint.activate([

//            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



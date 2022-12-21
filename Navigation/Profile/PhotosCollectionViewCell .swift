//
//  PhotocViewCollection .swift
//  Navigation
//
//  Created by Мария on 21.12.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    private let photoImageView = UIImageView()


    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.clipsToBounds = true
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            //photoImageView.widthAnchor.constraint(equalToConstant: //<#T##CGFloat#>) 
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(image: UIImage) {
        photoImageView.image = image
    }

}

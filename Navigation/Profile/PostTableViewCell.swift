//
//  File.swift
//  Navigation
//
//  Created by Мария on 14.12.2022.
//

import Foundation
import UIKit
class PostTableViewCell: UITableViewCell {

    let postAutor: UILabel = {
        let autor = UILabel()
        autor.text = "Hello"
        autor.font = .systemFont(ofSize: 20, weight: .bold)
        autor.textColor = .black
        autor.numberOfLines = 2
        autor.translatesAutoresizingMaskIntoConstraints = false
        return autor
    }()

   let postImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let postText: UILabel = {
        let postText = UILabel()
        postText.font = .systemFont(ofSize: 14)
        postText.textColor = .systemGray
        postText.numberOfLines = 0
        postText.translatesAutoresizingMaskIntoConstraints = false
        return postText
    }()

    let postLike: UILabel = {
        let likeLabel = UILabel()
        likeLabel.text = "Likes"
        likeLabel.font = .systemFont(ofSize: 16)
        likeLabel.textColor = .black
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        return likeLabel
    }()

    let postView: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.text = "View"
        viewsLabel.font = .systemFont(ofSize: 16)
        viewsLabel.textColor = .black
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMyCell()

    }

    func setupMyCell() {

        contentView.addSubview(postAutor)
        contentView.addSubview(postImage)
        contentView.addSubview(postText)
        contentView.addSubview(postLike)
        contentView.addSubview(postView)

    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            postImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            postImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            postImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 48),
            postImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),

            postAutor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postAutor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            postText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            postLike.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 16),
            postLike.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),


            postView.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 16),
            postLike.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -16)
            ])
    }


    func configure(post: Post) {



    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

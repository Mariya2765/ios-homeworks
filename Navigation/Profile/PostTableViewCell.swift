//
//  File.swift
//  Navigation
//
//  Created by Мария on 14.12.2022.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {

    private let postAutor: UILabel = {
        let autor = UILabel()
        autor.text = "Hello"
        autor.font = .systemFont(ofSize: 20, weight: .bold)
        autor.textColor = .black
        autor.numberOfLines = 2
        autor.translatesAutoresizingMaskIntoConstraints = false
        return autor
    }()

   private let postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let postTextLabel: UILabel = {
        let postText = UILabel()
        postText.font = .systemFont(ofSize: 14)
        postText.textColor = .systemGray
        postText.numberOfLines = 0
        postText.translatesAutoresizingMaskIntoConstraints = false
        return postText
    }()

    private let postLikeLabel: UILabel = {
        let likeLabel = UILabel()
        likeLabel.text = "Likes"
        likeLabel.font = .systemFont(ofSize: 16)
        likeLabel.textColor = .black
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        return likeLabel
    }()

    private let postViewLabel: UILabel = {
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
        addConstraints()
        selectionStyle = .none
    }

    func setupMyCell() {

        contentView.addSubview(postAutor)
        contentView.addSubview(postImageView)
        contentView.addSubview(postTextLabel)
        contentView.addSubview(postLikeLabel)
        contentView.addSubview(postViewLabel)

    }

    func addConstraints() {
        NSLayoutConstraint.activate([

            postAutor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postAutor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postAutor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),


            postImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            postImageView.topAnchor.constraint(equalTo: postAutor.bottomAnchor, constant: 16),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),

            postTextLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postLikeLabel.topAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: 16),
            postLikeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),


            postViewLabel.topAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: 16),
            postViewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }


    func configure(post: Post) {

        postImageView.image = UIImage(named: post.image)
        postAutor.text = post.autor
        postTextLabel.text = post.description
        postLikeLabel.text = "Likes: \(post.likes)"
        postViewLabel.text = String(post.views)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

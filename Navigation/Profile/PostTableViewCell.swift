//
//  File.swift
//  Navigation
//
//  Created by Мария on 14.12.2022.
//

import Foundation
import UIKit
class PostTableViewCell: UITableViewCell {



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMyCell()


    }

    func setupMyCell() {

        let autor = UILabel()

        autor.text = "Hello"
        autor.font = .systemFont(ofSize: 20, weight: .bold)
        autor.textColor = .black
        autor.numberOfLines = 2
        autor.translatesAutoresizingMaskIntoConstraints = false

        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black

        image.translatesAutoresizingMaskIntoConstraints = false

        let postText = UILabel()
        postText.font = .systemFont(ofSize: 14)
        postText.textColor = .systemGray
        postText.numberOfLines = 0
        postText.translatesAutoresizingMaskIntoConstraints = false

        let likeLabel = UILabel()
        likeLabel.text = "Likes"
        likeLabel.font = .systemFont(ofSize: 16)
        likeLabel.textColor = .black
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let viewsLabel = UILabel()
        viewsLabel.text = "View"
        viewsLabel.font = .systemFont(ofSize: 16)
        viewsLabel.textColor = .black
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false



        contentView.addSubview(autor)
        contentView.addSubview(image)
        contentView.addSubview(postText)
        contentView.addSubview(likeLabel)
        contentView.addSubview(viewsLabel)


    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            autor.constraints



            ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




//    override init(frame: CGRect) { др инит стиль какой-то
//        super.init(frame: frame)

        //addElements()
        //addConstraints()

//    }

//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
}

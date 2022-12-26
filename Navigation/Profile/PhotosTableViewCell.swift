//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Мария on 20.12.2022.
//

import Foundation
import UIKit

protocol TableCellWithCollectionDelegate: AnyObject {
    func openImageGallery(image: UIImage)
}

class PhotosTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    private enum Constants {
        static let reuseIdentifier = "collection_cell"
    }

    private let titleLabel = UILabel()
    private let viewArrow = UIImageView()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()
    )
    private var heightOfCell = sizeOfCollectionView
    private var imagesArray: [UIImage] = []

    var delegate: TableCellWithCollectionDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none

        titleLabel.text = "Photos"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])

        viewArrow.image = UIImage(systemName: "arrow.right")
        viewArrow.tintColor = .black
        viewArrow.contentMode = .scaleAspectFill

        contentView.addSubview(viewArrow)
        viewArrow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewArrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            viewArrow.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            viewArrow.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)

        ])

        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo:  titleLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: sizeOfCollectionView().height + 12)
        ])

        // регистрируем PhotosCollectionViewCell
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)

        // задаем направление скроллинга - горизонтальное
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.sectionInset = .init(top: 0, left: 12, bottom: 0, right: 12)
            flowLayout.minimumLineSpacing = 8
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func sizeOfCollectionView() -> CGSize {
        let numberOfCells: CGFloat = 4
        let offsetBetweenCells: CGFloat = 8
        let offsetFromCellToScreen: CGFloat = 12
        let screenWidth = UIScreen.main.bounds.width
        let side = (screenWidth - offsetBetweenCells * (numberOfCells - 1) - offsetFromCellToScreen * 2) / numberOfCells
        let sizeOfCell = CGSize(width: side, height: side)
        
        return sizeOfCell
    }

    func configure(imagesArray: [UIImage]) {
        self.imagesArray = imagesArray

        collectionView.reloadData()
    }

    //UICollectionViewDelegateFlowLayout - обработка нажатия на картинку

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.openImageGallery(image: imagesArray[indexPath.row])
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return sizeOfCollectionView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 12, left: 12, bottom: 12, right: 12)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }

 // UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return imagesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
        if indexPath.row <= 3 {
            cell.configure(image: imagesArray[indexPath.row], needForCorners: true)

            return cell
        } else {
            return cell
        }
    }
    
}

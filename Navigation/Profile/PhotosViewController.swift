//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Мария on 23.12.2022.
//

import Foundation
import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    private enum Constants {
        static let reuseIdentifier = "collection_cell"
    }

    private let arrayOfImages: [UIImage]

    init(array: [UIImage]) {
        self.arrayOfImages = array
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsOfCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false

        navigationItem.title = "Photo Gallery"
        navigationItem.titleView?.isHidden = true

        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)
    }

    func addConstraintsOfCollectionView() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeOfCollectionView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(
            top: 8,
            left: 8,
            bottom: 0,
            right: 8
        )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    // UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        arrayOfImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
        cell.configure(image: arrayOfImages[indexPath.row], needForCorners: false)

        return cell
    }

    func createGalleryNavigationBar() {
        let galleryNavigationController = UINavigationController(rootViewController: PhotosViewController(array: arrayOfImages))
        let appearanceGallery = UINavigationBarAppearance()
        appearanceGallery.configureWithDefaultBackground()
        galleryNavigationController.navigationBar.standardAppearance = appearanceGallery
        galleryNavigationController.navigationBar.scrollEdgeAppearance = appearanceGallery
        galleryNavigationController.navigationBar.tintColor = .black

        navigationController?.present(galleryNavigationController, animated: true)
    }

    func sizeOfCollectionView() -> CGSize {
        let numberOfCells: CGFloat = 3
        let offsetBetweenCells: CGFloat = 8
        let offsetFromCellToScreen: CGFloat = 8
        let screenWidth = UIScreen.main.bounds.width
        let side = (screenWidth - offsetBetweenCells * (numberOfCells - 1) - offsetFromCellToScreen * 2) / numberOfCells
        let sizeOfCell = CGSize(width: side, height: side)
        return sizeOfCell
    }

}

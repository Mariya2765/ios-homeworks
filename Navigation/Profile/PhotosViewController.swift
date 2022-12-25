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

        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)
    }
    func addConstraintsOfCollectionView() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
    }

    // UICollectionViewDelegateFlowLayout





    // UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
        cell.configure(image: arrayOfImages[indexPath.row])
       //        PhotosTableViewCell.
               return cell
    }


//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
//        cell.configure(image: imagesArray[indexPath.row])
//        PhotosTableViewCell.
//        return cell
//        }
//    }



}
//
//class Box {
//
//}
//
//class Car {
//    var boxes: [Box]
//
//    init(boxes: [Box]) {
//        self.boxes = boxes
//    }
//
//    init(box: Box) {
//        self.boxes = [box]
//    }
//
//    init() {
//        self.boxes = []
//    }
//}
//
//let box: Box = Box()
//let myCar = Car(boxes: [])
//let secondCar = Car()
//let thirdCar = Car(box: box)

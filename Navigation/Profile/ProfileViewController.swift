//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Мария on 01.12.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {

    private enum Constants {
        static let reuseIdentifire = "cellID"
        static let collectionID = "collectID"
    }
    
    let publicationsArray = PostProvider.getPost()
    private let headerView = ProfileHeaderView()
    var arrayOfImages: [UIImage] = [UIImage(named: "berries")!,
                                    UIImage(named: "flowers")!,
                                    UIImage(named: "home")!,
                                    UIImage(named: "stones")!,
                                    UIImage(named: "sunset")!,
                                    UIImage(named: "balloons")!,
                                    UIImage(named: "river")!,
                                    UIImage(named: "temple")!,
                                    UIImage(named: "airplane")!,
                                    UIImage(named: "theater")!,
                                    UIImage(named: "sunset homes")!,
                                    UIImage(named: "mosque")!,
                                    UIImage(named: "mushrooms")!,
                                    UIImage(named: "town")!,
                                    UIImage(named: "cone")!,
                                    UIImage(named: "boletus")!,
                                    UIImage(named: "maple leaf")!,
                                    UIImage(named: "chocolate bomb")!,
                                    UIImage(named: "chocolate coconut")!,
                                    UIImage(named: "watch")!]
    
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        self.tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifire )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        self.tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifire)
        addConstraintsOfTableView()
        self.tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: Constants.collectionID)
        tableView.sectionFooterHeight = 0.0
       
    }

    func addConstraintsOfTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// UIDataSource
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate, TableCellWithCollectionDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return publicationsArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.collectionID, for: indexPath) as! PhotosTableViewCell

            cell.configure(imagesArray: arrayOfImages)
            cell.delegate = self

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifire, for: indexPath) as! PostTableViewCell
            let post = publicationsArray[indexPath.row]
            cell.configure(post: post)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return headerView
        } else {
            return .none
        }
    }

    //при нажатии на картинку открывается newViewController  
    func openImageGallery(image: UIImage) {
        let newViewController = PhotosViewController(array: arrayOfImages)
        //present(newViewController, animated: true)
        navigationController?.pushViewController(newViewController, animated: true)
    }
}

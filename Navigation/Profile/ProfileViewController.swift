//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Мария on 01.12.2022.
//

import Foundation
import UIKit

let reuseIdentifire = "cellID"

class ProfileViewController: UIViewController {


    let publicationsArray = Post.getPost()


    private lazy var tableView: UITableView = {

        let tableView = UITableView()
        self.tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: reuseIdentifire )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()


    override func viewDidLoad() {
           super.viewDidLoad()

        view.addSubview(tableView)
        self.tableView.register(PostTableViewCell.self, forCellReuseIdentifier: reuseIdentifire)


        addConstraintsOfTableView()

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
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        publicationsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifire, for: indexPath) //as! PostTableViewCell
        let post = publicationsArray[indexPath.row]


//        var content = cell.defaultContentConfiguration()
//        content.text = post.autor
//        content.secondaryText = post.description
//        content.image = UIImage(named: post.image)
//
//
//        cell.contentConfiguration = content

        
        cell.textLabel?.text = post.autor
        cell.imageView?.image = UIImage(named: post.image)
        
//        cell.textLabel?.text = publicationsArray[indexPath.item].description
//        cell.imageView?.image = UIImage(named: publicationsArray[indexPath.item].image)

        return cell
            }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = ProfileHeaderView()
            headerView.translatesAutoresizingMaskIntoConstraints = false
            func addConstraintsOfViwe() {
            NSLayoutConstraint.activate([
                headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                headerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
            }

            return headerView
        } else {
            return nil
    }




    }

}






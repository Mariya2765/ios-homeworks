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

    let publicationsArray = PostProvider.getPost()

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .grouped)
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

    let headerViwe = ProfileHeaderView()

}
// UIDataSource
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        publicationsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifire, for: indexPath) as! PostTableViewCell
        let post = publicationsArray[indexPath.row]
        cell.configure(post: post)

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerViwe
    }

}






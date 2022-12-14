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

    let treePost = Post(autor: "Эколог", description: "Привет! С днем защиты деревьев от дровосеков!", image: "tree", likes: 85, views: 170)
    let familyPost = Post(autor: "Family search", description: "Родство означает связанность людей родственными связями. Сегодня поговорим о кровном родстве. Кровное прямое: в соседних поколениях (отец, мать - дети), через поколение (дед, бабушка - внук, внучка), через два поколения (прадед, прабабка - правнук, правнучка), через несколько поколений (предок - потомок). В русской генеалогии прямым считается родство исключительно по мужской линии «от отца к сыну нисходящее». Кровное непрямое: родные, сводные, двоюродные, троюродные. В соседник поколениях - дядя, тетя, племянники, племянницы, двоюродный дядя/тетя, двоюродный племянник/племянница", image: "family", likes: 5, views: 25)
    let winterPost = Post(autor: "Child", description: "С первым снегом, друзья!", image: "winter", likes: 30, views: 80)
    let gardenPost = Post(autor: "Peter", description: "Осень в Летнем саду", image: "", likes: 28, views: 75)

    private var publicationsArray = [Post]()


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

        addOfPosts()
        addConstraintsOfTableView()

    }
    func addOfPosts() {
        publicationsArray.append(treePost)
        publicationsArray.append(familyPost)
        publicationsArray.append(winterPost)
        publicationsArray.append(gardenPost)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifire) as! PostTableViewCell
        cell.textLabel?.text = publicationsArray[indexPath.item].description
        cell.imageView?.image = UIImage(named: publicationsArray[indexPath.item].image)

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






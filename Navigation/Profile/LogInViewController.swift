//
//  LogInViewController.swift
//  Navigation
//
//  Created by Мария on 09.12.2022.
//
import Foundation
import UIKit

class LogInViewController: UIViewController {

   
    private let logoView = LogInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logoView)
        
        logoView.translatesAutoresizingMaskIntoConstraints = false

        addConstraints()
    }


    func addConstraints() {
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            logoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            logoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

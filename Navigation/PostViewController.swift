//
//  PostViewController.swift
//  Navigation
//
//  Created by Мария on 26.11.2022.
//

import UIKit

class PostViewController: UIViewController {

    @objc func barButtonAction() {
        let infoVc = InfoViewController()
       present(infoVc, animated: true)
    }
    
    let post: Post
    init(post: Post) {
    self.post = post
    super.init(nibName: nil, bundle: nil)
    }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.title = self.post.title

        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(barButtonAction))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

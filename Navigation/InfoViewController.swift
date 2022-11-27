//
//  InfoViewController.swift
//  Navigation
//
//  Created by Мария on 27.11.2022.
//

import UIKit

class InfoViewController: UIViewController {

    @objc func buttonActionInfo() {

        let alertController = UIAlertController(title: "Проголосуйте", message: "Вам понравился пост?", preferredStyle: .alert)
        alertController.addAction(
            UIAlertAction(title: "Да", style: .default, handler: { _ in
                print("yes")
            }
        )
    )
        alertController.addAction(
            UIAlertAction(title: "Нет", style: .default, handler: { _ in
                print("no")
            }
        )
    )
        alertController.addAction(.init(title: "", style: .cancel))
        present(alertController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        // Do any additional setup after loading the view.

        let buttonInfo = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 60))
        buttonInfo.backgroundColor = UIColor.systemBlue
        buttonInfo.setTitle("Обратная связь", for: .normal)
        buttonInfo.setTitleColor(.blue, for: .normal)
        buttonInfo.addTarget(self, action: #selector(buttonActionInfo) , for: .touchUpInside)
        self.view.addSubview(buttonInfo)


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

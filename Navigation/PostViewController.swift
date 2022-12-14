//
//  PostViewController.swift
//  Navigation
//
//  Created by Мария on 26.11.2022.
//

import UIKit

class PostViewController: UIViewController {

//    let firstPost = Post(autor: "Family search", description: "Здравствуйте! Здесь я буду публиковать различную информацию о семейных поисках.", image: "tree", likes: 3, views: 10)
//    let secondPost = Post(autor: "Family search", description: "Начнем с определения степеней родства. Родство означает связанность людей родственными связями. Сегодня поговорим о кровном родстве. Кровное прямое: в соседних поколениях (отец, мать - дети), через поколение (дед, бабушка - внук, внучка), через два поколения (прадед, прабабка - правнук, правнучка), через несколько поколений (предок - потомок). В русской генеалогии прямым считается родство исключительно по мужской линии «от отца к сыну нисходящее». Кровное непрямое: родные, сводные, двоюродные, троюродные. В соседник поколениях - дядя, тетя, племянники, племянницы, двоюродный дядя/тетя, двоюродный племянник/племянница", image: "family", likes: 5, views: 25)
//    let postArhipovFamily = Post(autor: "Family search", description: "Хочу поделиться отправной точкой, имеющейся у меня информацией на момент начала погружения в историю семьи. Вводные данные были такими: семья Архиповых - Карп Андреевич и его жена Павла, у них дети Татьяна, Иван, Сергей, Наталья. Семья Водиных - Стефан Кириллович и МарияСидоровна, у них дети Николай, Василий, Петр, Прасковья, Екатерина. Все говорили, что Стефан Кириллович не воевал. Это все, что было известно. После нескольких месяцев работы с архивными документами, удалось составить такую схему предков Архипова Александра Сергеевича", image: "family Arhipov", likes: 30, views: 80)
//    let postFamilyBook = Post(autor: "Family search", description: "Чтобы не потерять и систематизировать найденную информацию, я решила собрать все в книгу. Собрала все имеющиеся фотографии, записи из метрических книг и ревизских сказок, нарисовала схемы родства - все это уместилось на 188 листах", image: "book", likes: 28, views: 75)
//
//    var publicationsArray = [Post]()


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
//
//        publicationsArray.append(firstPost)
//        publicationsArray.append(secondPost)
//        publicationsArray.append(postArhipovFamily)
//        publicationsArray.append(postFamilyBook)



        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(barButtonAction))
    }

    @objc private func barButtonAction() {
        let infoVc = InfoViewController()
        present(infoVc, animated: true)
    }


    
}

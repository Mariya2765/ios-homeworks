//
//  Post.swift
//  Navigation
//
//  Created by Мария on 27.11.2022.
//

import Foundation

struct Post {
    var autor: String
    var description: String
    var image: String
    var likes: Int
    var views: Int

}

extension Post {
    static func getPost() -> [Post] {
        [
            Post(autor: "Эколог", description: "Привет! С днем защиты деревьев от дровосеков!", image: "tree", likes: 85, views: 170),
            Post(autor: "Family search", description: "Родство означает связанность людей родственными связями. Сегодня поговорим о кровном родстве. Кровное прямое: в соседних поколениях (отец, мать - дети), через поколение (дед, бабушка - внук, внучка), через два поколения (прадед, прабабка - правнук, правнучка), через несколько поколений (предок - потомок). В русской генеалогии прямым считается родство исключительно по мужской линии «от отца к сыну нисходящее». Кровное непрямое: родные, сводные, двоюродные, троюродные. В соседник поколениях - дядя, тетя, племянники, племянницы, двоюродный дядя/тетя, двоюродный племянник/племянница", image: "family", likes: 5, views: 25),
            Post(autor: "Child", description: "С первым снегом, друзья!", image: "winter", likes: 30, views: 80),
            Post(autor: "Peter", description: "Осень в Летнем саду", image: "", likes: 28, views: 75)
        ]
    }
}

//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Мария on 27.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func createFeedViewController() -> UINavigationController {
        let fnc = UINavigationController(rootViewController: FeedViewController())
        fnc.tabBarItem = UITabBarItem(title: "Лента" , image: UIImage (systemName: "rectangle.grid.2x2" ), tag: 0)
        return fnc
    }

    func createProfileViewController() -> UINavigationController {
        let snc = UINavigationController(rootViewController: ProfileViewController())
        snc.tabBarItem = UITabBarItem(title: "Профиль" , image: UIImage (systemName: "person.crop.circle" ), tag: 0)
        return snc
    }


    func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createFeedViewController(), createProfileViewController()]
        return tabBar
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
        window.rootViewController = createTabBarController()
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}


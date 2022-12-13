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
        let feedNavigationController = UINavigationController(rootViewController: FeedViewController())
        feedNavigationController.tabBarItem = UITabBarItem(title: "Лента" , image: UIImage (systemName: "house.fill" ), tag: 0)
        return feedNavigationController
    }

    func createProfileViewController() -> UINavigationController {
        let profileNavigationController = UINavigationController(rootViewController: LogInViewController())
        profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль" , image: UIImage (systemName: "person.fill" ), tag: 0)

        let appearanceProfile = UINavigationBarAppearance()
        appearanceProfile.configureWithDefaultBackground()
        profileNavigationController.navigationBar.standardAppearance = appearanceProfile
        profileNavigationController.navigationBar.scrollEdgeAppearance = appearanceProfile
        profileNavigationController.navigationBar.isHidden = true
        
        return profileNavigationController
    }

    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = .white
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
        tabBarController.viewControllers = [createFeedViewController(), createProfileViewController()]
        return tabBarController
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


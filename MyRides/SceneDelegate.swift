//
//  SceneDelegate.swift
//  MyRides
//
//  Created by Ralston Goes on 6/28/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        // Setup root navigation controller
        let navController = UINavigationController(rootViewController: MyRidesViewController())
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .hsdBlue
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = appearance
        navController.navigationBar.compactAppearance = appearance
        navController.navigationBar.compactScrollEdgeAppearance = appearance
        
        window.rootViewController = navController
        window.makeKeyAndVisible()
        window.backgroundColor = .white
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) {  }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}


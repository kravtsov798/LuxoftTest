//
//  SceneDelegate.swift
//  Technical-test
//
//  Created by Andrey Kravtsov on 16.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        guard let window = window else { return }
        window.makeKeyAndVisible()
        
        coordinator = AppCoordinator(window: window)
        coordinator?.start()
    }
}

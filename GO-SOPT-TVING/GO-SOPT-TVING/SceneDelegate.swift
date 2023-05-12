//
//  SceneDelegate.swift
//  GO-SOPT-TVING
//
//  Created by 김사랑 on 2023/04/20.
//
import UIKit

import Inject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
    
//        let injectViewController = Inject.ViewControllerHost(MyPageViewController())
        self.window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: MainViewController())
        self.window?.rootViewController = navigationController
//        self.window?.rootViewController = injectViewController
        self.window?.makeKeyAndVisible()
    }
}

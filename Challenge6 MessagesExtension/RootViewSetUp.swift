//
//  RootViewSetUp.swift
//  Challenge6 MessagesExtension
//
//  Created by Nick Gordon on 5/9/23.
//

import Foundation
import UIKit

//to avoid using storyboard
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        guard let windowScene = (scene as? UIWindowScene) else {return}
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        window?.windowScene = windowScene
        window?.rootViewController = MessagesViewController()
        window?.makeKeyAndVisible()
    }
}

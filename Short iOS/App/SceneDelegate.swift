//
//  SceneDelegate.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/24.
//

import UIKit
import RealmSwift

let realm = RealmStart.realmShared

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        // 로그인 상태에 따라 초기 뷰 컨트롤러 결정
        let initialViewController: UIViewController = {
            if let loginData = realm.objects(LocalLoginCheckData.self).first, loginData.checkLogin == true {
                // 로그인 상태일 경우 DetailViewController 표시
                return DetailViewController()
            } else {
                // 로그인 상태가 아닐 경우 LoginViewController 표시
                return LoginViewController()
            }
        }()
        // UIWindow 초기화 및 rootViewController 설정
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: initialViewController)
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}


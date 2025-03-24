//
//  OBPageTwoViewController.swift
//  newsapp
//
//  Created by Jishnu Biju [Litmus7] on 11/03/25.
//

import UIKit

class OBPageTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func getStartedBtnTapped(_ sender: Any) {
        //TODO add logic for adding hasCompletedOB to userdefaults
        let tabBarController = MainTabBarController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = tabBarController
            window.makeKeyAndVisible()
        }
    }
}

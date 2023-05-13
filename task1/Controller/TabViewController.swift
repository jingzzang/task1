//
//  TabViewController.swift
//  task1
//
//  Created by 이지은 on 2023/05/09.
//

import UIKit

class TabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = UINavigationController(rootViewController: MainViewController(nibName: "Main", bundle: nil))
        mainVC.view.backgroundColor = .white
        mainVC.tabBarItem = customTabBarItem(image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"), tag: 0)
        
        let serviceVC = ServiceViewController(nibName: "Service", bundle: nil)
        serviceVC.view.backgroundColor = .white
        serviceVC.tabBarItem = customTabBarItem(image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"), tag: 1)
        
        let historyVC = HistoryViewController(nibName: "History", bundle: nil)
        historyVC.view.backgroundColor = .white
        historyVC.tabBarItem = customTabBarItem(image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear.fill"), tag: 2)
        
        let settingsVC = SettingsViewController(nibName: "Settings", bundle: nil)
        settingsVC.view.backgroundColor = .white
        settingsVC.tabBarItem = customTabBarItem(image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"), tag: 3)
        
        viewControllers = [mainVC ,serviceVC, historyVC, settingsVC]
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        goLogin()
//    }
//    
    func customTabBarItem(image: UIImage?, selectedImage: UIImage?, tag: Int) -> UITabBarItem {
        let item = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
        item.tag = tag
        item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
        
        return item
    }
    
//    func goLogin() {
//        let loginVC = LoginViewController(nibName: "Login", bundle: nil)
//        loginVC.modalPresentationStyle = .overFullScreen
//        present(loginVC, animated: false, completion: nil)
//        navigationController?.setNavigationBarHidden(true, animated: false)
//        navigationController?.pushViewController(loginVC, animated: false)
//    }
}

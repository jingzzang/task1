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
        
        let mainVC = MainViewController()
        mainVC.view.backgroundColor = .white
        mainVC.tabBarItem = tabBarItem(image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"), tag: 0)
        
        let serviceVC = ServiceViewController()
        serviceVC.view.backgroundColor = .white
        serviceVC.tabBarItem = tabBarItem(image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"), tag: 1)
        
        let historyVC = HistoryViewController()
        historyVC.view.backgroundColor = .white
        historyVC.tabBarItem = tabBarItem(image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear.fill"), tag: 2)
        
        let settingsVC = SettingsViewController()
        settingsVC.view.backgroundColor = .white
        settingsVC.tabBarItem = tabBarItem(image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"), tag: 3)
        
        // Set the view controllers for the tab bar controller
        viewControllers = [mainVC ,serviceVC, historyVC, settingsVC]
    }
    
    
    func tabBarItem(image: UIImage?, selectedImage: UIImage?, tag: Int) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
        tabBarItem.tag = tag
        
        tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        return tabBarItem
    }
}

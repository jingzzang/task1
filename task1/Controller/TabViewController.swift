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
        
        let firstVC = MainViewController()
        firstVC.view.backgroundColor = .white
        firstVC.tabBarItem = tabBarItem(image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"), tag: 0)
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .white
        secondVC.tabBarItem = tabBarItem(image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"), tag: 1)
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .white
        thirdVC.tabBarItem = tabBarItem(image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear.fill"), tag: 2)
        
        let fourthVC = UIViewController()
        fourthVC.view.backgroundColor = .white
        fourthVC.tabBarItem = tabBarItem(image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"), tag: 3)
        
        // Set the view controllers for the tab bar controller
        viewControllers = [firstVC ,secondVC, thirdVC, fourthVC]
    }
    
    
    func tabBarItem(image: UIImage?, selectedImage: UIImage?, tag: Int) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
        tabBarItem.tag = tag
        
        tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        return tabBarItem
    }
}

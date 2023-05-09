//
//  ViewController.swift
//  task1
//
//  Created by 이지은 on 2023/05/08.
//

import UIKit

class MainViewController: UIViewController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("MainViewController is loaded.")
        tabBarController?.delegate = self
    }
}

extension MainViewController {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if let idx = tabBarController.viewControllers?.firstIndex(of: viewController) {
            print("SELECTED INDEX : \(idx)")
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let idx = tabBarController.viewControllers?.firstIndex(of: viewController) else {
            return true
        }
        
        if idx == 0 {
            // Load the specific storyboard and view controller
            let sbInfo = UIStoryboard(name: "Info", bundle: nil)
            let infoViewController = sbInfo.instantiateViewController(withIdentifier: "infoBaseView")
            tabBarController.selectedViewController = infoViewController

            return false // Do not proceed with the default tab selection
        }

            return true // Proceed with the default tab selection
    }
}

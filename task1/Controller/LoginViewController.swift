//
//  LoginViewController.swift
//  task1
//
//  Created by 이지은 on 2023/05/10.
//

import UIKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        //hide Navigation Bar
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
    }
    
    @IBAction func goBtnClick(_ sender: UIButton) {
        Data.shared.isLogin = true
        navigationController?.popViewController(animated: false)
    }
}

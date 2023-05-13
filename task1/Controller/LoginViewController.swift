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
        navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
    }
    
    @IBAction func goBtnClick(_ sender: UIButton) {
        Data.shared.isLogin = true
//        self.dismiss(animated: false)
        navigationController?.popViewController(animated: false)
    }
}

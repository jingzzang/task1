//
//  TempNextViewController.swift
//  task1
//
//  Created by 징 on 2023/05/15.
//

import UIKit

class TempNextViewController: UIViewController {

    var isModal: Bool = true
    @IBOutlet weak var closeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isModal {
            tabBarController?.tabBar.isHidden = true
        }
    }
    
    @IBAction func cloaseBtnClick(_ sender: UIButton) {
        if isModal {
            self.dismiss(animated: true)
        }else {
            navigationController?.popViewController(animated: true)
        }
    }
}

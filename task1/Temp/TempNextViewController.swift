//
//  TempNextViewController.swift
//  task1
//
//  Created by 징 on 2023/05/15.
//

import UIKit

class TempNextViewController: UIViewController {

    var isModal: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cloaseBtnClick(_ sender: UIButton) {
        if isModal {
            self.dismiss(animated: true)
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
}

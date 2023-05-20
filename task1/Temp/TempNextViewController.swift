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
    @IBOutlet weak var resultLabel: UILabel!
    
    var text: String = "Welcome"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isModal {
            tabBarController?.tabBar.isHidden = true
        }
        
        resultLabel.text = text
    }
    
    @IBAction func cloaseBtnClick(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("showMain"), object: false)
        
        if isModal {
            self.dismiss(animated: true)
        }else {
            navigationController?.popViewController(animated: true)
        }
    }
}

//
//  EditAccountModalViewController.swift
//  task1
//
//  Created by 징 on 2023/05/21.
//

import UIKit

class EditAccountModalViewController: UIViewController {
    
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBtn.backgroundColor = .daisyDaisy
        saveBtn.layer.cornerRadius = 10
    }
    
    @IBAction func closeBtnClick(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveBtnClick(_ sender: UIButton) {
        print("save Button Clicked")
    }
}

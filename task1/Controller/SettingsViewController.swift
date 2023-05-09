//
//  SettingsViewController.swift
//  task1
//
//  Created by 이지은 on 2023/05/10.
//

import UIKit

final class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setNib()
    }
    
    func setNib() {
        let nib = UINib(nibName: "Settings", bundle: nil)
        if let settingsView = nib.instantiate(withOwner: nil, options: nil).first as? UIView {
            view.addSubview(settingsView)
        }
    }
}

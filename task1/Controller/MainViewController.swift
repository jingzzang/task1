//
//  ViewController.swift
//  task1
//
//  Created by 이지은 on 2023/05/08.
//

import UIKit

final class MainViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNib()
    }
    
    func setNib() {
        let nib = UINib(nibName: "Main", bundle: nil)
        if let mainView = nib.instantiate(withOwner: nil, options: nil).first as? UIView {
            view.addSubview(mainView)
        }
    }
}

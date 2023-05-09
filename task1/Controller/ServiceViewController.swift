//
//  ServiceViewController.swift
//  task1
//
//  Created by 이지은 on 2023/05/10.
//

import UIKit

final class ServiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNib()
    }
    
    func setNib() {
        let nib = UINib(nibName: "Service", bundle: nil)
        if let serviceView = nib.instantiate(withOwner: nil, options: nil).first as? UIView {
            view.addSubview(serviceView)
        }
    }
}

//
//  ServiceViewController.swift
//  task1
//
//  Created by 이지은 on 2023/05/10.
//

import UIKit

final class ServiceViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(contentView)
    }
}

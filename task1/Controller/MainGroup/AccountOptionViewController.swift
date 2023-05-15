//
//  AccountOptionViewController.swift
//  task1
//
//  Created by 징 on 2023/05/14.
//

import UIKit

class AccountOptionViewController: UIViewController {

    private var isWithoutTheAcctNum: Bool = false
    
    init(isWithoutTheAcctNum: Bool) {
        super.init(nibName: "AccountOptionView", bundle: nil)
        self.isWithoutTheAcctNum = isWithoutTheAcctNum
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

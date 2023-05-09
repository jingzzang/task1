//
//  HistoryViewController.swift
//  task1
//
//  Created by 이지은 on 2023/05/10.
//

import UIKit

final class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNib()
    }

    func setNib() {
        let nib = UINib(nibName: "History", bundle: nil)
        if let historyView = nib.instantiate(withOwner: nil, options: nil).first as? UIView {
            view.addSubview(historyView)
        }
    }
}

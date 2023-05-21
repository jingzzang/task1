//
//  EditAccountModalViewController.swift
//  task1
//
//  Created by 징 on 2023/05/21.
//

import UIKit

class EditAccountModalViewController: UIViewController {
    
    private var isChanged: Bool = false {
        didSet{
            saveBtn.isEnabled = isChanged
            saveBtn.backgroundColor = saveBtn.isEnabled ? .daisyDaisy : .lightGrey
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var visibleAccount: UIView!
    
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var showAmountToggle: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAmountToggle.tintColor = .daisyDaisy
        
        contentView.addSubview(visibleAccount)
        scrollView.addSubview(contentView)
        showAmountToggle.isOn = !UserDefaults.standard.bool(forKey: "isHiddenAmount")
        saveBtn.layer.cornerRadius = 10
    }
    
    @IBAction func closeBtnClick(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveBtnClick(_ sender: UIButton) {
        UserDefaults.standard.set(!showAmountToggle.isOn, forKey: "isHiddenAmount")
        weak var pvc = self.presentingViewController
        self.dismiss(animated: true, completion: {
            NotificationCenter.default.post(name: NSNotification.Name("showMain"), object: true)
            pvc?.view.showToast(msg: "수정이 완료되었습니다.", duration: 2.0, bottomConstant: -120)
        })
    }
    
    @IBAction func showAmountToggleClicked(_ sender: UISwitch) {
        isChanged = true
    }
}

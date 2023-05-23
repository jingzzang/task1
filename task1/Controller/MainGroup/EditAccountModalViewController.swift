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
    
    // Base views
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet var lineView: UIView!
    @IBOutlet var contentBaseView: UIView!
    
    // The views for Visible accounts
    @IBOutlet var visibleAccountView: UIView!
    @IBOutlet weak var showAmountToggle: UISwitch!
    
    // The views for Invisible accounts
    @IBOutlet var invisibleAccountView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAmountToggle.onTintColor = .daisyDaisy
        
        visibleAccountView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(visibleAccountView)
        scrollView.addSubview(lineView)
        
        contentView.addSubview(contentBaseView)
        
        NSLayoutConstraint.activate([
            visibleAccountView.topAnchor.constraint(equalTo: contentBaseView.topAnchor),
            lineView.topAnchor.constraint(equalTo: visibleAccountView.bottomAnchor)
        ])
        
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

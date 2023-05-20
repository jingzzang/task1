//
//  AccountNameEditingViewController.swift
//  task1
//
//  Created by 징 on 2023/05/14.
//

import UIKit

class AccountNameEditingViewController: UIViewController {
    
    @IBOutlet weak var AcctNameTextField: UITextField!
    
    var data: AccountInfo?
    
    override func viewDidLoad() {
        AcctNameTextField.text = data?.accountName ?? ""
        AcctNameTextField.returnKeyType = .done // Keyboard 완료 키
        
        AcctNameTextField.delegate = self
        AcctNameTextField.becomeFirstResponder()
    }
    
    
    @IBAction func cancelBtnClick(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("showMain"), object: false)
        
        self.dismiss(animated: true)
    }
}

extension AccountNameEditingViewController: UITextFieldDelegate {
    // 리턴 키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        data?.accountName = AcctNameTextField.text!
        DataManager.updateAcctInfoData(data: data!)
        textField.resignFirstResponder()
        self.dismiss(animated: true){
            NotificationCenter.default.post(name: NSNotification.Name("showMain"), object: true)
        }
        return true
    }
}

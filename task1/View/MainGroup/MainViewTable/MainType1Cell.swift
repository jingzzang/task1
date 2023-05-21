//
//  MainType1Cell.swift
//  task1
//
//  Created by 이지은 on 2023/05/11.
//

import UIKit

class MainType1Cell: UITableViewCell {
    weak var delegate: MainTypeCellDelegate?
    private var data: AccountInfo?
    
    @IBOutlet var background: MainType1Cell!
    @IBOutlet weak var acctName: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var amountMask: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        background.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(data: AccountInfo, isMaskHidden: Bool = false) {
        self.data = data
        background.backgroundColor = data.backgroundColor
        amountMask.setWidthConstraint(width: Constraint(amount))
        amountMask.isEnabled = !isMaskHidden
        amountMask.isHidden = isMaskHidden
        
        amountMask.backgroundColor = data.backgroundColor
        acctName.text = data.accountName
        amount.text = String(data.amount).getWon()
    }
    
    @IBAction func moreBtnClick(_ sender: UIButton) {
        delegate?.moreButtonClicked(isWithoutTheAcctNum: false, acctInfo: data)
    }
    
    @IBAction func cardBtnClick(_ sender: UIButton) {
        delegate?.moveButtonClicked(isModal: true)
    }
    
    @IBAction func sendMoneyBtnClick(_ sender: UIButton) {
        delegate?.moveButtonClicked(isModal: true)
    }
    
    @IBAction func accountDetailBtnClick(_ sender: UIButton) {
        delegate?.moveButtonClicked(isModal: false)
    }
    
    @IBAction func firstAddItemBtnClick(_ sender: UIButton) {
        delegate?.moveButtonClicked(isModal: true)
    }
    
    @IBAction func secondItemBtnClick(_ sender: UIButton) {
        delegate?.moveButtonClicked(isModal: true)
    }
    
    @IBAction func pressMask(_ sender: UIButton) {
        amountMask.isHidden = true
    }
    
    @IBAction func unpressMask(_ sender: UIButton) {
        amountMask.isHidden = false
    }
    
    @IBAction func unpressMaskOutside(_ sender: UIButton) {
        amountMask.isHidden = false
    }
}

protocol MainTypeCellDelegate: AnyObject {
    func moreButtonClicked(isWithoutTheAcctNum: Bool, acctInfo: AccountInfo?)
    
    //temp function
    func moveButtonClicked(isModal: Bool)
}


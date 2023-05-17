//
//  MainType3Cell.swift
//  task1
//
//  Created by 이지은 on 2023/05/11.
//

import UIKit

class MainType3Cell: UITableViewCell {
    private var data: AccountInfo?
    weak var delegate: MainTypeCellDelegate?
    
    @IBOutlet var background: UIView!
    @IBOutlet weak var acctName: UILabel!
    @IBOutlet weak var saveCnt: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(data: AccountInfo) {
        self.data = data
        
        background.backgroundColor = data.backgroundColor
        acctName.text = data.accountName
        amount.text = String(data.amount).getWon()
        
        if let cnt = data.saveCount {
            if cnt >= 0 {
                saveCnt.text = " "+String(cnt) + "회 "
            }else {
                saveCnt.isHidden = true
            }
        }
    }
    
    @IBAction func moveButtonClicked(_ sender: UIButton) {
        delegate?.moveButtonClicked(isModal: false)
    }
    
    @IBAction func moreBtnClick(_ sender: UIButton) {
        delegate?.moreButtonClicked(isWithoutTheAcctNum: false, acctInfo: data)
    }
}

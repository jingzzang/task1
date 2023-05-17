//
//  MainType2Cell.swift
//  task1
//
//  Created by 이지은 on 2023/05/11.
//

import UIKit

class MainType2Cell: UITableViewCell {

    var delegate: MainTypeCellDelegate?
    private var data: AccountInfo?
    
    @IBOutlet var background: UIView!
    @IBOutlet weak var userImgs: UIImageView!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var acctName: UILabel!
    
    
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
        userImgs.image = data.image
        acctName.text = data.accountName
        amount.text = String(data.amount).getWon()
    }
    
    @IBAction func moveButtonClicked(_ sender: UIButton) {
        delegate?.moveButtonClicked(isModal: false)
    }
    
    @IBAction func moreBtnClick(_ sender: UIButton) {
        delegate?.moreButtonClicked(isWithoutTheAcctNum: true, acctInfo: data)
    }
}

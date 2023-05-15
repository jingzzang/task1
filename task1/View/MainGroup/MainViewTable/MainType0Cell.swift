//
//  MainType0Cell.swift
//  task1
//
//  Created by 이지은 on 2023/05/11.
//

import UIKit

class MainType0Cell: UITableViewCell {
    var delegate: MainTypeCellDelegate?
    
    @IBOutlet var background: UIView!
    @IBOutlet weak var button: UIButton!
    
    var type: ButtonType = .OpeningAccount
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    // mark : cell 데이터 세팅
    
    func configure(data: AccountInfo) {
        type = data.btnType ?? .OpeningAccount
        background.backgroundColor = data.backgroundColor
        
        if type == .OpeningAccount {
            let buttonTitle = "+"
            let boldFont = UIFont.boldSystemFont(ofSize: 17)

            button.titleLabel?.font = boldFont
            button.setTitle(buttonTitle, for: .normal)
        }else {
            let buttonTitle = "화면 편집"
            let font = UIFont.systemFont(ofSize: 15)
            
            button.titleLabel?.font = font
            button.setTitleColor(.grey, for: .normal)
            button.setTitle(buttonTitle, for: .normal)
        }
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if type == .OpeningAccount {
            delegate?.moveButtonClicked(isModal: true)
        }else { // 화면 편집 모달
            delegate?.moveButtonClicked(isModal: false)
        }
    }
    
}

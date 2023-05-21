//
//  EtcMainCell.swift
//  task1
//
//  Created by 징 on 2023/05/21.
//

import UIKit

class EtcMainCell: UITableViewCell {
    var delegate: EtcMainCellDelegate?
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        background.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(isPlus: Bool) {
        if isPlus {
            let buttonTitle = "+"
            let boldFont = UIFont.boldSystemFont(ofSize: 17)
            background.backgroundColor = .lightGrey
            
            button.titleLabel?.font = boldFont
            button.setTitle(buttonTitle, for: .normal)
            button.tag = 1
        }else {
            let buttonTitle = "화면 편집"
            let font = UIFont.systemFont(ofSize: 15)
            background.backgroundColor = .clear
            
            button.titleLabel?.font = font
            button.setTitleColor(.grey, for: .normal)
            button.setTitle(buttonTitle, for: .normal)
            button.tag = -1
        }
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if sender.tag > 0 {
            delegate?.openAddAccountModal()
        }else {
            delegate?.openEditAccountModal()
        }
    }
}

protocol EtcMainCellDelegate {
    func openAddAccountModal()
    func openEditAccountModal()
}

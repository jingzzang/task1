//
//  MainType0Cell.swift
//  task1
//
//  Created by 이지은 on 2023/05/11.
//

import UIKit

class MainType0Cell: UITableViewCell {
    
    @IBOutlet var background: UIView!
    
    var type: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //outlet setting
    func configure(data: MainCellItem) {
//        type = data.btnType!
        
//        let color = data.backgroundColor
//        background.backgroundColor = UIColor(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
//
//        if type == 1 {
//            let buttonTitle = "+"
//            let boldFont = UIFont.boldSystemFont(ofSize: 17)
//
//            button.titleLabel?.font = boldFont
//            button.setTitle(buttonTitle, for: .normal)
//        }else {
//            button.setTitle("화면 편집", for: .normal)
//        }
    }
}

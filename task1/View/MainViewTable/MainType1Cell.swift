//
//  MainType1Cell.swift
//  task1
//
//  Created by 이지은 on 2023/05/11.
//

import UIKit

class MainType1Cell: UITableViewCell {

    @IBOutlet var background: MainType1Cell!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        background.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

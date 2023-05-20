//
//  AddAccountModalCell.swift
//  task1
//
//  Created by 징 on 2023/05/20.
//

import UIKit

class AddAccountModalCell: UITableViewCell {

    var delegate: AddAccountModalCellDelegate?
    
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var acctTypeLabel: UILabel!
    
    private var data: ProductInfo?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(data: ProductInfo) {
        self.data = data
        acctTypeLabel.text = data.typeName
        expLabel.text = data.exp
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        delegate?.goToMall(info: data!)
    }
}

protocol AddAccountModalCellDelegate: AnyObject {
    func goToMall(info: ProductInfo)
}

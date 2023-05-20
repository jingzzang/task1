//
//  AdsCell.swift
//  task1
//
//  Created by 징 on 2023/05/21.
//

import UIKit

class AdsCell: UITableViewCell {
    
    var delegate: AdsCellDelegate?
    
    private var info: AdsInfo?
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var adsImage: UIImageView!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        background.backgroundColor = .lightGrey
        background.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(info: AdsInfo){
        self.info = info
        self.adsImage.image = UIImage(named: "logo")
        self.expLabel.text = info.exp
        self.titleLabel.text = info.title
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        delegate?.showAdsDetail()
    }
    
}

protocol AdsCellDelegate: AnyObject {
    func showAdsDetail()
}

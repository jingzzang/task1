//
//  ColorCell.swift
//  task1
//
//  Created by 징 on 2023/05/16.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIImageView!
    @IBOutlet weak var isChecked: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureUI(color: UIColor, isYours: Bool) {
        colorView.layer.cornerRadius = colorView.frame.size.height / 2
        colorView.backgroundColor = color
        isChecked.isHidden = !isYours
    }
}

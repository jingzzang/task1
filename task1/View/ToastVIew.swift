//
//  Toast.swift
//  task1
//
//  Created by 징 on 2023/05/17.
//

import UIKit

class ToastView: UIView {
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(msg: String) {
        super.init(frame: .zero)
        backgroundColor = .black
        
        layer.cornerRadius = 8.0
        
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0)
        ])
        
        label.text = msg
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


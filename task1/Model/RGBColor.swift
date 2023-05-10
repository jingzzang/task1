//
//  RGBColor.swift
//  task1
//
//  Created by 이지은 on 2023/05/11.
//

import Foundation

struct RGBColor {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var alpha: CGFloat
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat? = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha!
    }
}

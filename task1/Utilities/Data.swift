//
//  Data.swift
//  task1
//
//  Created by 이지은 on 2023/05/10.
//

import Foundation

//singleton

class Data {
    static let shared = Data()
    
    var isLogin: Bool = false
    var showAds: Bool = true
    
    private init() {
        
    }
}

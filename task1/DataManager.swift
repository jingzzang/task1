//
//  DataManager.swift
//  task1
//
//  Created by 징 on 2023/05/15.
//

import UIKit

class DataManager {
    private var acctInfoDataArray: [AccountInfo] = []
    
    func makeTempData() {
        acctInfoDataArray = [
            AccountInfo(type: 1, accountName: "입출금", amount: 20000, backgroundColor: RGBColor(red: , green: <#T##CGFloat#>, blue: <#T##CGFloat#>))
        ]
        
//        var type: Int
//        var btnType: Int?
//        var accountName: String
//        var amount: Int
//        var backgroundColor: RGBColor
//        var img: String?
//        var moneyboxYn: Bool?
//        var safeboxYn: Bool?
//        var firstBtnName: String?
//        var secondBtnName: String?
    }
    
    func getAcctInfo() -> [AccountInfo] {
        return acctInfoDataArray
    }
    
    func updateAcctInfoData() {
    }
}

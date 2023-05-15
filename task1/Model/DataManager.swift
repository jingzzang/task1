//
//  DataManager.swift
//  task1
//
//  Created by 징 on 2023/05/15.
//

import UIKit

class DataManager {
    private var acctInfoData: [AccountInfo] = [
        AccountInfo(type: 1, accountNum: "000-000-001", accountName: "생활비", amount: 210000, backgroundColor: .echoBlue),
        AccountInfo(type: 2, accountNum: "000-000-002", accountName: "🍄", amount: 612000, backgroundColor: .copper),
        AccountInfo(type: 3, accountNum: "000-000-003", accountName: "내 적금", amount: 350000, backgroundColor: .iceBerg),
        AccountInfo(type: 3, accountNum: "000-000-004", accountName: "예금", amount: 350000, backgroundColor: .coralCandy),
        AccountInfo(type: 1, accountNum: "000-000-005", accountName: "비상금", amount: 1450000, backgroundColor: .schooner),
        AccountInfo(type: 0, btnType: 0 ,accountNum: "-", accountName: "-", amount: 0, backgroundColor: .blackWhite),
//        AccountInfo(type: 0, btnType: 1 ,accountNum: "-", accountName: "-", amount: 0, backgroundColor: .white)
    ]
    
    func getAcctInfo() -> [AccountInfo] {
        return acctInfoData
    }
    
    func updateAcctInfoData() {
    }
    
    func openAccount(type: Int, amount: Int) {
        var acctName: String {
            get {
                switch(type) {
                    case 1: return "입출금 통장"
                    case 2: return "모임통장"
                    case 3: return "적립식 통장"
                    default: return "통장"
                }
            }
        }
        let acctNum = acctInfoData.count - 1
        
        let newData = AccountInfo(type: type, accountNum: String(acctNum).getNewAcctNum(), accountName: acctName, amount: amount, backgroundColor: CommonUtil().pickRandom())
        acctInfoData.insert(newData, at: acctInfoData.count-2)
    }
}

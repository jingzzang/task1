//
//  DataManager.swift
//  task1
//
//  Created by 징 on 2023/05/15.
//

import UIKit

class DataManager {
    private var acctInfoData: [AccountInfo] = [
        AccountInfo(type: .Deposit, accountNum: "000-000-001", accountName: "생활비", amount: 210000, backgroundColor: .echoBlue),
        AccountInfo(type: .Party, accountNum: "000-000-002", accountName: "🍄", amount: 612000, backgroundColor: .patternsBlue, image: UIImage(named: "friends")),
        AccountInfo(type: .Saving, accountNum: "000-000-003", accountName: "내 적금", amount: 350000, backgroundColor: .iceBerg, saveCount: 5),
        AccountInfo(type: .Saving, accountNum: "000-000-004", accountName: "예금", amount: 10000000, backgroundColor: .coralCandy, saveCount: -1),
        AccountInfo(type: .Deposit, accountNum: "000-000-005", accountName: "비상금", amount: 145000, backgroundColor: .schooner),
        AccountInfo(type: .Default, btnType: .OpeningAccount ,accountNum: "-", accountName: "-", amount: 0, backgroundColor: .lightGrey),
        AccountInfo(type: .Default, btnType: .EditingView ,accountNum: "-", accountName: "-", amount: 0, backgroundColor: .white)
    ]
    
    func getAcctInfo() -> [AccountInfo] {
        return acctInfoData
    }
    
    func updateAcctInfoData() {
    }
    
    func openAccount(type: CellType, amount: Int) {
        var acctName: String {
            get {
                switch(type) {
                    case .Deposit: return "입출금 통장"
                    case .Party: return "모임통장"
                    case .Saving: return "적립식 통장"
                    default: return "통장"
                }
            }
        }
        let acctNum = acctInfoData.count - 1
        
        let newData = AccountInfo(type: type, accountNum: String(acctNum).getNewAcctNum(), accountName: acctName, amount: amount, backgroundColor: CommonUtil().pickRandom())
        acctInfoData.insert(newData, at: acctInfoData.count-2)
    }
}

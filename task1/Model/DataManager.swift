//
//  DataManager.swift
//  task1
//
//  Created by 징 on 2023/05/15.
//

import UIKit

class DataManager {
    static var productData: [ProductInfo] = [
        ProductInfo(type: .Deposit, typeName: "입출금통장", exp: "까다로운 계좌개설도 손쉽게"),
        ProductInfo(type: .Extra, typeName: "세이프박스", exp: "여유자금을 따로 보관하세요"),
        ProductInfo(type: .Extra, typeName: "저금통", exp: "매일매일 조금씩 쌓여요"),
        ProductInfo(type: .Saving, typeName: "정기예금", exp: "실시간 이자가 쌓여요"),
        ProductInfo(type: .Saving, typeName: "자유적금", exp: "매일/매주/매월 자유롭게"),
        ProductInfo(type: .Party, typeName: "최애적금", exp: "기록통장의 첫번째 기록 서비스"),
        ProductInfo(type: .Saving, typeName: "26주적금", exp: "캐릭터와 함께 즐거운 도전")
    ]
    
    static var acctInfoData: [AccountInfo] = [
        AccountInfo(type: .Deposit, accountNum: "000-000-001", accountName: "생활비", amount: 210000, backgroundColor: .echoBlue),
        AccountInfo(type: .Party, accountNum: "000-000-002", accountName: "🍄", amount: 612000, backgroundColor: .patternsBlue, image: UIImage(named: "friends")),
        AccountInfo(type: .Saving, accountNum: "000-000-003", accountName: "내 적금", amount: 350000, backgroundColor: .iceBerg, saveCount: 5),
        AccountInfo(type: .Saving, accountNum: "000-000-004", accountName: "예금", amount: 10000000, backgroundColor: .coralCandy, saveCount: -1),
        AccountInfo(type: .Deposit, accountNum: "000-000-005", accountName: "비상금", amount: 145000, backgroundColor: .schooner)
    ]
    
    static func getAcctData(isAll: Bool) -> [AccountInfo] {
        return []
    }
    
    static func updateAcctInfoData(data: AccountInfo) {
        if let idx = acctInfoData.firstIndex(where: { $0.accountNum == data.accountNum }) {
            acctInfoData[idx] = data
        }
    }
    
    static func openAccount(type: CellType, amount: Int) {
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
    
    static func closeAccount(data: AccountInfo) {
        acctInfoData.removeAll(where: { $0.accountNum == data.accountNum })
    }
}

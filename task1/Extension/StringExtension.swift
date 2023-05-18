//
//  StringExtension.swift
//  task1
//
//  Created by 징 on 2023/05/15.
//

import UIKit

let MAX_ACCT_NUM_LENGTH = 9

extension String {
    func getNewAcctNum() -> String {
        let arr = Array(repeating: "0", count: MAX_ACCT_NUM_LENGTH - self.count) + Array(self)
        return String(arr[0 ..< 3]) + "-" + String(arr[3 ..< 6]) + "-" + String(arr[6 ..< 9])
    }
    
    func getWon() -> String {
        let arr = Array(self.reversed())
        var won = ""
        var cnt = 0
        for i in 0 ..< arr.count {
            won = String(arr[i]) + won
            cnt += 1
            if i != arr.count-1 {
                if cnt == 3 {
                    cnt = 0
                    won = "," + won
                }
            }
        }
        
        return won+"원"
    }
    
    /* Clipboard 이체 여부 체크 */
    
    func isAccountNumber() -> Bool {
        let onlyNums = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        // 정규식 처리 추가
        return onlyNums.count > 5
    }
}

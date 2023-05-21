//
//  MainCellModel.swift
//  task1
//
//  Created by 이지은 on 2023/05/10.
//

import UIKit

enum CellType {
    case Default
    case Deposit
    case Party
    case Saving
    case Extra
}

/*
 * type : 셀 종류
 * 0 : 단순 이미지 버튼
 * 1 : 입출금
 * 2 : 모임통장 (moneybox/safeboxYn 불가)
 * 3 : 적립식 상품
 */

enum ButtonType {
    case OpeningAccount
    case EditingView
}

struct AccountInfo {
    var type: CellType              // 셀 타입
    var btnType: ButtonType?        // Type 0 Cell Button Type
    var accountNum: String          // 계좌번호
    var accountName: String         // 통장 이름
    var amount: Int                 // 금액
    var backgroundColor: UIColor    // 셀 백그라운드 컬러
    var saveCount: Int?             // 적립식 예금 적립 횟수
    var cardYn: Bool = false        // 연결카드 보유 여부
    var image: UIImage?             // 모임통장 유저 프로필 이미지
    var moneyboxYn: Bool?           // 저금통 여부
    var safeboxYn: Bool?            // 세이프박스 여부
    var isVisible: Bool = true      // 메인노출 여부
    var isPrimary: Bool = true      // (입출금 통장 중) 메인계좌 여부
}

struct ProductInfo {
    var type: CellType
    var typeName: String
    var exp: String
}

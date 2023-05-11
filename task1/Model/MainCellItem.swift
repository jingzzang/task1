//
//  MainCellModel.swift
//  task1
//
//  Created by 이지은 on 2023/05/10.
//

import Foundation

struct MainCellItem {
    var type: Int
    var btnType: Int?
    var accountName: String
    var amount: Int
    var backgroundColor: RGBColor
    var img: String?
    var moneyboxYn: Bool?
    var safeboxYn: Bool?
    var firstBtnName: String?
    var secondBtnName: String?
}

/*
 * type : 셀 종류
 * 0 : 단순 이미지 버튼 (btnType: 1 - 상품가입모달, 2 - 화면편집모달)
 * 1 : 입출금
 * 2 : 모임통장 (moneybox/safeboxYn 불가)
 * 3 : 적립식 상품
 */

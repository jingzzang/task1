//
//  CommonUitl.swift
//  task1
//
//  Created by 이지은 on 2023/05/10.
//

import UIKit

final class CommonUtil {
    func pickRandom() -> UIColor {
        let bgColorArray: [[UIColor]] = [[.daisyDaisy, .blackWhite, .dustStorm, .copper],
                                         [.coralCandy, .illusion, .indianRed, .cabaret],
                                         [.echoBlue, .violetBlue, .dustStorm, .chetwodeBlue],
                                         [.iceBerg, .mantis, .fern, .lochinvar],
                                         [.solitude, .patternsBlue, .regentStBlue, .fountainBlue],
                                         [.malibu, .havelockBlue, .royalBlue, .cornflowerBlue],
                                         [.juniper, .airForceBlue, .lochmara, .bahamaBlue],
                                         [.kashmirBlue,.shuttleGrey,.mortar, .schooner],
                                         [.cloud, .auChico]]
        let colorRow = Int.random(in: 0 ..< bgColorArray.count)
        let colorCol = Int.random(in: 0 ..< bgColorArray[colorRow].count)
        return bgColorArray[colorRow][colorCol]
    }
}

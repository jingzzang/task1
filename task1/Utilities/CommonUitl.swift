//
//  CommonUitl.swift
//  task1
//
//  Created by 이지은 on 2023/05/10.
//

import UIKit

final class CommonUtil {
    let colorArray: [UIColor] = [.daisyDaisy, .blackWhite, .dustStorm, .copper,
                                 .coralCandy, .illusion, .indianRed, .cabaret,
                                 .echoBlue, .violetBlue, .dustStorm, .chetwodeBlue,
                                 .iceBerg, .mantis, .fern, .lochinvar,
                                 .solitude, .patternsBlue, .regentStBlue, .fountainBlue,
                                 .malibu, .havelockBlue, .royalBlue, .cornflowerBlue,
                                 .juniper, .airForceBlue, .lochmara, .bahamaBlue,
                                 .kashmirBlue,.shuttleGrey,.mortar, .schooner,
                                 .cloud, .auChico]
    
    func pickRandom() -> UIColor {
        let idx = Int.random(in: 0 ..< colorArray.count)
        return colorArray[idx]
    }
}

//
//  Calu.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import Foundation

class CalculateViewModel {

    func calculate(upTo Num: Int) -> Int {

        return (2...Num).reduce(1) { $1 % 2 == 0 ? $0 + $1 : $0 - $1 }

    }

}

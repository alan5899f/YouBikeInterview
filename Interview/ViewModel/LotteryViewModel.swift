//
//  LotteryViewModel.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import Foundation

class LotteryViewModel {

    private var prizes: [String] = []

    init(firstPrize: Int, secondPrize: Int, thirdPrize: Int, fourthPrize: Int, fifthPrize: Int) {
        prizes += Array(repeating: "1獎", count: firstPrize)
        prizes += Array(repeating: "2獎", count: secondPrize)
        prizes += Array(repeating: "3獎", count: thirdPrize)
        prizes += Array(repeating: "4獎", count: fourthPrize)
        prizes += Array(repeating: "5獎", count: fifthPrize)
    }

    func lotteryAuto(completion: @escaping (String) -> Void) {

        while !prizes.isEmpty {
            
            let randomIndex = Int.random(in: 0..<prizes.count)
            let selectedPrize = prizes.remove(at: randomIndex)

            completion("抽到 \(selectedPrize) 目前尚未抽取的獎勵為 \(prizes)")

        }

        completion("所有獎項已抽完")

    }

    func lotterySingle() -> String {

        if !prizes.isEmpty {

            let randomIndex = Int.random(in: 0..<prizes.count)
            let selectedPrize = prizes.remove(at: randomIndex)

            return "抽到 \(selectedPrize) 目前尚未抽取的獎勵為 \(prizes)"

        }
        else {

            return "所有獎項已抽完"

        }

    }

}

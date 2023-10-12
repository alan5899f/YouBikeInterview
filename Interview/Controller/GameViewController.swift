//
//  ViewController.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import UIKit

class GameViewController: UIViewController {

    private let calculateViewModel = CalculateViewModel()
    private let lotteryViewModel = LotteryViewModel(firstPrize: 1, secondPrize: 1, thirdPrize: 2, fourthPrize: 5, fifthPrize: 11)

    private lazy var calculateBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("點擊我運算", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapCalculate), for: .touchUpInside)
        return button
    }()

    private lazy var lotteryAutoBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("一鍵自動抽獎", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapLotteryAuto), for: .touchUpInside)
        return button
    }()

    private lazy var lotterySingleBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("單一抽獎", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapLotterySingle), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
    }

    private func setView() {
        view.addSubview(calculateBtn)
        view.addSubview(lotteryAutoBtn)
        view.addSubview(lotterySingleBtn)
    }

    private func setLayout() {

        // Calculate Layout
        calculateBtn.anchor(centerX: view.centerXAnchor, centerY: view.centerYAnchor, width: 100, height: 50)

        // LotteryAuto Layout
        lotteryAutoBtn.anchor(top: calculateBtn.bottomAnchor, centerX: view.centerXAnchor, width: 200, height: 50, topPadding: 20)

        // LotterySingle Layout
        lotterySingleBtn.anchor(top: lotteryAutoBtn.bottomAnchor, centerX: view.centerXAnchor, width: 200, height: 50, topPadding: 20)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayout()
    }

}


// MARK: Event
extension GameViewController {

    @objc private func didTapCalculate() {

        let result = calculateViewModel.calculate(upTo: 100)
        print(result)

    }

    @objc private func didTapLotteryAuto() {

        lotteryViewModel.lotteryAuto { result in

            print(result)

        }

    }

    @objc private func didTapLotterySingle() {

        let result = lotteryViewModel.lotterySingle()
        print(result)

    }

}

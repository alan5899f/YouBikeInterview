//
//  UbikeTableHeaderView.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import UIKit

class UbikeTableHeaderView: UIView {

    private var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "縣市"
        return label
    }()

    private var areaLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "區域"
        return label
    }()

    private var stationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "站點名稱"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .greenColor
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = 12
        setView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error")
    }

    private func setView() {
        addSubview(cityLabel)
        addSubview(areaLabel)
        addSubview(stationLabel)
    }

    private func setLayout() {
        cityLabel.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, width: 80)
        areaLabel.anchor(top: topAnchor, bottom: bottomAnchor, left: cityLabel.rightAnchor, width: 130)
        stationLabel.anchor(top: topAnchor, bottom: bottomAnchor, left: areaLabel.rightAnchor, right: rightAnchor)
    }

}

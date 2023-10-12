//
//  UbikeCell.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import Foundation
import UIKit

class UbikeCell: UITableViewCell {

    static let identifier = "UbikeCell"

    private var cityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()

    private var areaLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private var stationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error")
    }

    public func setConfigure(_ data: UbikeModel) {
        cityLabel.text = "台北市"
        areaLabel.text = data.sarea
        stationLabel.text = data.sna
    }

    private func setView() {
        contentView.addSubview(cityLabel)
        contentView.addSubview(areaLabel)
        contentView.addSubview(stationLabel)
    }

    private func setLayout() {
        cityLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor, width: 80)
        areaLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: cityLabel.rightAnchor, width: 130)
        stationLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: areaLabel.rightAnchor, right: contentView.rightAnchor, topPadding: 20, bottomPadding: 20, rightPadding: 10)
    }

}

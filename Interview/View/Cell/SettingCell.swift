//
//  SettingCell.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import Foundation
import UIKit

class SettingCell: UITableViewCell {

    static let identifier = "SettingCell"

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .greenColor
        setView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error")
    }

    public func setConfigure(_ data: String) {
        titleLabel.text = data
    }

    /// True = 黑色, False = 白色
    public func setColor(_ bool: Bool) {
        titleLabel.textColor = bool ? .black : .white
    }

    private func setView() {
        contentView.addSubview(titleLabel)
    }

    private func setLayout() {
        titleLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor, height: 60)
    }

}

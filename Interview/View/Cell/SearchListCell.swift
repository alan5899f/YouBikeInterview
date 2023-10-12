//
//  SearchListCell.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import Foundation
import UIKit

class SearchListCell: UITableViewCell {

    static let identifier = "SearchListCell"

    private var cityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkWhiteColor
        setView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error")
    }

    public func setConfigure(_ data: String) {
        cityLabel.text = data
    }

    public func setColor(_ bool: Bool) {
        cityLabel.textColor = bool ? .greenColor : .black
    }

    private func setView() {
        contentView.addSubview(cityLabel)
    }

    private func setLayout() {
        cityLabel.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, left: contentView.leftAnchor, height: 50, leftPadding: 20)
    }

}

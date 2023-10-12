//
//  SearchView.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import UIKit

class SearchBarView: UIView {

    private var searchLabel: UILabel = {
        let label = UILabel()
        label.textColor = .grayColor
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        label.text = "搜尋站點"
        return label
    }()

    private var searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")?.withConfiguration(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 20))).withTintColor(.greenColor, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    var handleCompletion: () -> () = { }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkWhiteColor
        layer.cornerRadius = 8
        layer.masksToBounds = true
        setView()
        setLayout()
        setHandle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setConfigure(area: String) {
        searchLabel.text = area
        searchLabel.textColor = .greenColor
    }

    private func setHandle() {
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapHandle))
        addGestureRecognizer(tap)
    }

    private func setView() {
        addSubview(searchLabel)
        addSubview(searchIcon)
    }

    private func setLayout() {
        searchLabel.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, topPadding: 5, bottomPadding: 5, leftPadding: 20)
        searchIcon.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor, topPadding: 5, bottomPadding: 5, rightPadding: 20)
    }

}

// MARK: Event
extension SearchBarView {

    @objc private func didTapHandle() {

        handleCompletion()

    }

}

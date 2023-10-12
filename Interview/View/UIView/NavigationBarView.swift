//
//  NavigationBar.swift
//  Interviews
//
//  Created by 陳韋綸 on 2023/10/11.
//

import Foundation
import UIKit

class NavigationBarView {

    var backHandle: () -> () = { }
    var listHandle: () -> () = { }

    private lazy var iconImg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon")
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()

    private lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 24, weight: .semibold)))?.withTintColor(UIColor.greenColor, renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        return button
    }()

    private lazy var listBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.3.horizontal")?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(font: .systemFont(ofSize: 24, weight: .semibold)))?.withTintColor(UIColor.greenColor, renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(didTapList), for: .touchUpInside)
        return button
    }()

    func setIcon() -> UIBarButtonItem {
        return UIBarButtonItem(customView: iconImg)
    }

    func setBackButton() -> UIBarButtonItem {
        return UIBarButtonItem(customView: backBtn)
    }

    func setListButton() -> UIBarButtonItem {
        return UIBarButtonItem(customView: listBtn)
    }

}

// MARK: Event
extension NavigationBarView {

    @objc private func didTapBack() {
        backHandle()
    }

    @objc private func didTapList() {
        listHandle()
    }

}

//
//  SearchListView.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import UIKit

class SearchListView: UIView {

    var areasData: [String] = [] {
        didSet {
            tableView.isScrollEnabled = areasData.count > 5
            tableView.reloadData()
            updateHeightConstraint()
        }
    }

    var selectedIndex: Int = .zero {
        didSet {
            tableView.reloadData()
        }
    }

    var didSelectedAreaCompletion: (String) -> () = { _ in }

    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .darkWhiteColor
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.register(SearchListCell.self, forCellReuseIdentifier: SearchListCell.identifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkWhiteColor
        layer.cornerRadius = 8
        layer.masksToBounds = true
        isHidden = true
        setView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        addSubview(tableView)
    }

    private func setLayout() {
        tableView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)
    }

    private func updateHeightConstraint() {
        self.heightAnchor.constraint(equalToConstant: (50 * min(areasData.count, 6)).toCGFloat()).isActive = true
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }

}

extension SearchListView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchListCell.identifier, for: indexPath) as? SearchListCell else {
            return UITableViewCell()
        }
        cell.setColor(selectedIndex == indexPath.row)
        cell.setConfigure(areasData[indexPath.row])
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areasData.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelectedAreaCompletion(areasData[indexPath.row])
        selectedIndex = indexPath.row
    }

}

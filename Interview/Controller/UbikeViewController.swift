//
//  UbikeViewController.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import UIKit

class UbikeViewController: UIViewController {

    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.tableHeaderView = UbikeTableHeaderView(frame: CGRect(x: 0, y: 0, width: Width - 60, height: 70))
        tableView.register(UbikeCell.self, forCellReuseIdentifier: UbikeCell.identifier)
        return tableView
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .greenColor
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "站點資訊"
        return label
    }()

    private let ubikeViewModel = UbikeViewModel()
    private let navigationView = NavigationBarView()
    private let searchView = SearchBarView()
    private let searchListView = SearchListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        ubikeViewModel.bindstart { [weak self] in
            DispatchQueue.main.async {
                self?.searchListView.areasData = self?.ubikeViewModel.getAllArea() ?? []
                self?.tableView.reloadData()
            }
        }

        setView()
        setHandle()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBarStyle()
    }

    private func setView() {
        navigationItem.leftBarButtonItem = navigationView.setIcon()
        navigationItem.rightBarButtonItem = navigationView.setListButton()
        view.addSubview(titleLabel)
        view.addSubview(searchView)
        view.addSubview(tableView)
        view.addSubview(searchListView)
    }

    private func setLayout() {
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 50, leftPadding: 30, rightPadding: 30)
        searchView.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, right: titleLabel.rightAnchor, height: 60, topPadding: 20)
        tableView.anchor(top: searchView.bottomAnchor, bottom: view.bottomAnchor, left: titleLabel.leftAnchor, right: titleLabel.rightAnchor, topPadding: 10)
        searchListView.anchor(top: searchView.bottomAnchor, left: titleLabel.leftAnchor, right: titleLabel.rightAnchor, topPadding: 10)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayout()
    }

    private func setupNavBarStyle() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = barAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
    }

}

extension UbikeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: UbikeCell.identifier, for: indexPath) as? UbikeCell else {
            return UITableViewCell()
        }

        cell.backgroundColor = indexPath.row % 2 == 0 ? .white : .darkWhiteColor
        cell.setConfigure(ubikeViewModel.filterData[indexPath.row])

        if indexPath.row == (ubikeViewModel.filterData.count - 1) {
            cell.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 12
        }

        return cell
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ubikeViewModel.filterData.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

// MARK: Event
extension UbikeViewController {

    private func setHandle() {

        navigationView.listHandle = { [weak self] in

            let vc = SettingViewController(selectedIndex: 2)
            self?.navigationController?.pushViewController(vc, animated: true)

        }

        searchView.handleCompletion = { [weak self] in

            self?.searchListView.isHidden.toggle()

        }

        searchListView.didSelectedAreaCompletion = { [weak self] area in

            self?.searchView.setConfigure(area: area)
            self?.ubikeViewModel.searchBindStart(area: area)
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }

        }

    }

}

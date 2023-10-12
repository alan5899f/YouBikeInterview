//
//  UbikeViewController.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import UIKit

class SettingViewController: UIViewController {

    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.register(SettingCell.self, forCellReuseIdentifier: SettingCell.identifier)
        tableView.backgroundColor = .greenColor
        tableView.isScrollEnabled = false
        return tableView
    }()

    private var loginBtn: UIButton = {
        let button = UIButton()
        button.setTitle("登入", for: .normal)
        button.setTitleColor(.greenColor, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        return button
    }()

    init(selectedIndex: Int) {
        super.init(nibName: nil, bundle: nil)
        settingViewModel.selectedIndex = selectedIndex
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let settingViewModel = SettingViewModel()
    private let navigationView = NavigationBarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .greenColor

        setView()
        setHandle()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBarStyle()
    }

    private func setView() {
        navigationItem.leftBarButtonItem = navigationView.setIcon()
        navigationItem.rightBarButtonItem = navigationView.setBackButton()
        view.addSubview(tableView)
        view.addSubview(loginBtn)
    }

    private func setLayout() {
        loginBtn.anchor(bottom: view.bottomAnchor, left: view.leftAnchor, width: 100, height: 50, bottomPadding: 30, leftPadding: 30)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: loginBtn.topAnchor, left: view.leftAnchor, right: view.rightAnchor, topPadding: 26, bottomPadding: 26, leftPadding: 26, rightPadding: 26)
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

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier, for: indexPath) as? SettingCell else {
            return UITableViewCell()
        }
        cell.setColor(indexPath.row == settingViewModel.selectedIndex)
        cell.setConfigure(settingViewModel.settingTitle[indexPath.row])
        return cell

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModel.settingTitle.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        settingViewModel.selectedIndex = indexPath.row
        navigationController?.popViewController(animated: true)
    }

}

// MARK: Event
extension SettingViewController {

    private func setHandle() {

        navigationView.backHandle = { [weak self] in

            self?.navigationController?.popViewController(animated: true)

        }

    }

}

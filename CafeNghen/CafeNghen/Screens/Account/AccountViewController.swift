//
//  AccountViewController.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 06/10/2023.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var accountTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegate()
    }
    
    private func setupUI() {
        let header = InfoView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150))
        accountTableView.tableHeaderView = header
    }
    
    private func setupDelegate() {
        accountTableView.delegate = self
        accountTableView.dataSource = self
        accountTableView.register(cellType: AccountItemCell.self)
    }
}

// MARK: UITableViewDelegate
extension AccountViewController: UITableViewDelegate { }

// MARK: UITableViewDataSource
extension AccountViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: AccountItemCell.self, for: indexPath)
        
        return cell
    }
}

//
//  FavoritesViewController.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 06/10/2023.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var addAllButton: UIButton!
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegate()
    }
    
    private func setupUI() { }
    
    private func setupDelegate() {
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.register(cellType: FavoriteItemCell.self)
    }
}

//// MARK: UITableViewDelegate
extension FavoritesViewController: UITableViewDelegate { }

// MARK: UITableViewDataSource
extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: FavoriteItemCell.self, for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}

//
//  CartViewController.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 06/10/2023.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegate()
    }
    
    private func setupUI() { }
    
    private func setupDelegate() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(cellType: CartItemCell.self)
    }
}

//// MARK: UITableViewDelegate
extension CartViewController: UITableViewDelegate { }

// MARK: UITableViewDataSource
extension CartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: CartItemCell.self, for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}

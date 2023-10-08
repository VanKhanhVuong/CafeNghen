//
//  FilterViewController.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 05/10/2023.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var filterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegate()
    }

    private func setupUI() { }
    
    private func setupDelegate() {
        filterTableView.delegate = self
        filterTableView.dataSource = self
        filterTableView.register(cellType: FilterItemCell.self)
    }
}

// MARK: UITableViewDelegate
extension FilterViewController: UITableViewDelegate { }

// MARK: UITableViewDataSource
extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = SectionView()
        sectionView.configUI(title: "Set title", isHiddenIcon: true)
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: FilterItemCell.self, for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}

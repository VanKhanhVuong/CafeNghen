//
//  HomeViewController.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 04/10/2023.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var productByGroupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegate()
    }
    
    private func setupUI() {
        let header = SliderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150))
        productByGroupTableView.tableHeaderView = header
        
        let footer = CategoryView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 180))
        productByGroupTableView.tableFooterView = footer
    }
    
    private func setupDelegate() {
        productByGroupTableView.delegate = self
        productByGroupTableView.dataSource = self
        productByGroupTableView.register(cellType: ProductByGroupCell.self)
    }
}

// MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate { }

// MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = SectionView()
        sectionView.delegate = self
        sectionView.configUI(title: "Set title", isHiddenIcon: false)
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ProductByGroupCell.self, for: indexPath)
        
        return cell
    }
}

// MARK: SectionViewEvents
extension HomeViewController: SectionViewEvents {
    func gotData(title: String) {
        print("Tapped \(title) group !")
    }
}

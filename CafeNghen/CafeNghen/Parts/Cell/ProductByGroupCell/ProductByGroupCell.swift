//
//  ProductByGroupCell.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 04/10/2023.
//

import UIKit

class ProductByGroupCell: UITableViewCell {

    @IBOutlet weak var productCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupDelegate()
    }
    
    private func setupUI() { }
    
    func setupDelegate() {
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(cellType: ProductCell.self)
    }
}

// MARK: UICollectionViewDelegate
extension ProductByGroupCell: UICollectionViewDelegate { 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Detail Product")
    }
}

// MARK: UICollectionViewDataSource
extension ProductByGroupCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: ProductCell.self, for: indexPath)
        cell.delegate = self
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ProductByGroupCell: UICollectionViewDelegateFlowLayout { 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 45) / 2, height: collectionView.frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
    }
}

// MARK: ProductCellEvents
extension ProductByGroupCell: ProductCellEvents {
    func buyTapped(id: String) {
        print("Buy product id \(id)")
    }
}

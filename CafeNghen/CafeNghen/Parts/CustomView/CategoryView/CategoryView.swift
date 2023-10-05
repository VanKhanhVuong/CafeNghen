//
//  CategoryView.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 05/10/2023.
//

import UIKit

class CategoryView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var sectionView: SectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override init (frame: CGRect){
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }
    
    private func commitInit() {
        Bundle.main.loadNibNamed(className.self, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        setupUI()
        setupDelegate()
    }
    
    private func setupUI() { 
        sectionView.arrowButton.isHidden = true
        sectionView.titleLabel.text = "Category"
    }
    
    private func setupDelegate() { 
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(cellType: CategoryCell.self)
    }

}

// MARK: UICollectionViewDelegate
extension CategoryView: UICollectionViewDelegate { }

// MARK: UICollectionViewDataSource
extension CategoryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: CategoryCell.self, for: indexPath)
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension CategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 15) / 1.5, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}

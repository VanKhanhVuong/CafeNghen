//
//  SliderView.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 04/10/2023.
//

import UIKit

class SliderView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
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
        
        setupDelegate()
    }
    
    private func setupUI() { }
    
    private func setupDelegate() {
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.register(cellType: SlideCell.self)
    }
}

// MARK: UICollectionViewDelegate
extension SliderView: UICollectionViewDelegate { }

// MARK: UICollectionViewDataSource
extension SliderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: SlideCell.self, for: indexPath)
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension SliderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

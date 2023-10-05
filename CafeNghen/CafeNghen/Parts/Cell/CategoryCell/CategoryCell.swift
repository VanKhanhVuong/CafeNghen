//
//  CategoryCell.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 05/10/2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() { }
    
    func config() { }
}

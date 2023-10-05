//
//  SlideCell.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 04/10/2023.
//

import UIKit

class SlideCell: UICollectionViewCell {

    @IBOutlet weak var slideImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() { 
        slideImageView.clipsToBounds = true
        slideImageView.layer.cornerRadius = 15
    }
    
    func configCell() { }

}

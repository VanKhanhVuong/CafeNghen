//
//  ProductCell.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 04/10/2023.
//

import UIKit

protocol ProductCellEvents: AnyObject {
    func buyTapped(id: String)
}

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    
    weak var delegate: ProductCellEvents?
    
    private var id: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.gray.cgColor
        
        buyButton.clipsToBounds = true
        buyButton.layer.cornerRadius = 15
        
        buyButton.setTitle("", for: .normal)
        buyButton.setImage(UIImage(systemName: "plus"), for: .normal)
        buyButton.tintColor = UIColor.white
    }
    
    func configCell() { }

    @IBAction func buyTapped(_ sender: Any) {
        self.delegate?.buyTapped(id: self.id)
    }
}

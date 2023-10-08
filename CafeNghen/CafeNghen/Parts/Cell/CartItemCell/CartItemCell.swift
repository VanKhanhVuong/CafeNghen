//
//  CartItemCell.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 05/10/2023.
//

import UIKit

protocol CartItemCellEvents: AnyObject {
    func amountNumber()
    func removeTapped()
}

class CartItemCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productInfoView: ProductNameView!
    
    weak var delegate: CartItemCellEvents?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        productInfoView.reloadView()
    }

    private func setupUI() {
        productInfoView.delegate = self
    }

    func config() { }
}

extension CartItemCell: ProductNameViewEvents {
    func icon() -> IconEnum {
        return .close
    }
    
    func removeProduct() {
        self.delegate?.removeTapped()
    }
}

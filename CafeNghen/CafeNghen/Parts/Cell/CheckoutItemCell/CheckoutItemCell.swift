//
//  CheckoutItemCell.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 06/10/2023.
//

import UIKit

class CheckoutItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() { }

    func config() { }
    
}

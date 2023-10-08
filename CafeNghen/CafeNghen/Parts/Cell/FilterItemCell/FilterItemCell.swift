//
//  FilterItemCell.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 05/10/2023.
//

import UIKit

protocol FilterItemCellEvents: AnyObject {
    func checkTapped(isCheck: Bool)
}

class FilterItemCell: UITableViewCell {
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: FilterItemCellEvents?
    
    // check temp
    var isCheck: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        checkButton.setTitle("", for: .normal)
        checkButton.tintColor = .white
        checkButton.clipsToBounds = true
        checkButton.layer.cornerRadius = 6
        checkButton.imageView?.contentMode = .center
        
        checkButton.layer.borderWidth = 1
        checkButton.layer.borderColor = UIColor.gray.cgColor
        checkButton.backgroundColor = .white
    }
    
    func checkAction() {
        self.checkButton.layer.borderWidth = self.isCheck ? 0 : 1
        self.checkButton.setImage(UIImage(systemName: self.isCheck ? "checkmark" : ""), for: .normal)
        self.checkButton.backgroundColor = self.isCheck ? .green : .white
        
        isCheck = !isCheck
        self.delegate?.checkTapped(isCheck: self.isCheck)
    }
    
    func config() { }
    
    @IBAction func checkTapped(_ sender: Any) {
        checkAction()
    }
}

//
//  SectionView.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 04/10/2023.
//

import UIKit

protocol SectionViewEvents: AnyObject {
    func gotData(title: String)
}

class SectionView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowButton: UIButton!
    
    weak var delegate: SectionViewEvents?
    
    override init (frame: CGRect) {
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
    }
    
    private func setupUI() {
        arrowButton.setTitle("", for: .normal)
        arrowButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        arrowButton.tintColor = UIColor.black
    }
    
    func configUI(title: String, isHiddenIcon: Bool) {
        self.titleLabel.text = title
        self.arrowButton.isHidden = isHiddenIcon
    }
    
    @IBAction func seeAllTapped(_ sender: Any) {
        self.delegate?.gotData(title: titleLabel.text ?? "")
    }
}

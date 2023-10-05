//
//  DropDownView.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 05/10/2023.
//

import UIKit

class DropDownView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
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
        actionClickDropDown()
    }
    
    func config(title: String, content: String) {
        titleLabel.text = title
        contentLabel.text = content
    }
    
    private func actionClickDropDown() {
        self.arrowImageView.image = UIImage(systemName: "chevron.down")
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.titleView.addGestureRecognizer(gesture)
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        if self.contentLabel.alpha == 0 {
            animate(toogle: true)
        } else {
            animate(toogle: false)
        }
    }
    
    private func animate(toogle: Bool) {
        if toogle {
            UIView.animate(withDuration: 0.3) {
                self.contentLabel.alpha = 1.0
                self.arrowImageView.image = UIImage(systemName: "chevron.down")
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.contentLabel.alpha = 0
                self.arrowImageView.image = UIImage(systemName: "chevron.up")
            }
        }
    }
}

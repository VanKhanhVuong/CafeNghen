//
//  InfoView.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 06/10/2023.
//

import UIKit

protocol InfoViewEvents: AnyObject {
    func changeInfo()
    func userInfo() -> User
}

struct User {
    var avatar: String
    var name: String
    var email: String
}

class InfoView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    weak var delegate: InfoViewEvents?
    
    private var user = User(avatar: "", name: "", email: "")
    
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
    }
    
    func reloadView() {
        if delegate != nil {
            user = delegate?.userInfo() ?? User(avatar: "", name: "", email: "")
        }
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        if !user.name.isEmpty {
            nameLabel.text = user.name
            emailLabel.text = user.email
        }
    }
    
    private func setupUI() { 
        changeButton.setTitle("", for: .normal)
    }
}

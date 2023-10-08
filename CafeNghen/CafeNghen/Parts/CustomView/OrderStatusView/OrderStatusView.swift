//
//  OrderStatusView.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 06/10/2023.
//

import UIKit

protocol OrderStatusViewEvents: AnyObject {
    func actionTapped()
    func successView() -> OrderStatus
}

struct OrderStatus {
    var image: String
    var title: String
    var subtitle: String
    var textButton: String
}

class OrderStatusView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    weak var delegate: OrderStatusViewEvents?
    
    private var status = OrderStatus(image: "", title: "", subtitle: "", textButton: "")
    
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
            status = delegate?.successView() ?? OrderStatus(image: "", title: "", subtitle: "", textButton: "")
        }
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        if !status.title.isEmpty {
            titleLabel.text = status.title
            subtitleLabel.text = status.subtitle
            closeButton.setTitle(status.textButton, for: .normal)
        }
    }
    
    private func setupUI() { 
        titleLabel.text = ""
        subtitleLabel.text = ""
        closeButton.setTitle("", for: .normal)
    }
}

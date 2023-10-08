//
//  ProductNamemeView.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 05/10/2023.
//

import UIKit

protocol ProductNameViewEvents : AnyObject {
    func removeProduct()
    func icon() -> IconEnum
}

class ProductNameView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    weak var delegate: ProductNameViewEvents?
    
    private var isCloseIcon: IconEnum = .none
    
    // var temp
    private var isLike: Bool = false
    
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
            isCloseIcon = delegate?.icon() ?? .none
        }
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        if isCloseIcon != .none {
            switch isCloseIcon {
            case .none:
                break
            case .close:
                heartButton.setImage(UIImage(systemName: "xmark"), for: .normal)
                heartButton.tintColor = .gray
                break
            case .like:
                heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
                heartButton.tintColor = .red
                break
            }
        }
    }
    
    private func setupUI() {
        minusButton.setTitle("", for: .normal)
        plusButton.setTitle("", for: .normal)
        
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.tintColor = UIColor.black
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.tintColor = UIColor.black
        
        heartButton.setTitle("", for: .normal)
        heartButton.setImage(UIImage(systemName: ""), for: .normal)
    }
    
    private func likeAction() {
        if self.isLike {
            UIView.animate(withDuration: 0.3) {
                self.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
        }
        isLike = !isLike
    }
    
    func config(name: String, unit: String, price: Float, amount: Int, isLike: Bool) {

    }
    
    @IBAction func likeTapped(_ sender: Any) {
        switch isCloseIcon {
        case .none:
            break
        case .close:
            self.delegate?.removeProduct()
        case .like:
            likeAction()
        }
    }
}

enum IconEnum {
    case none
    case close
    case like
}

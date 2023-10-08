//
//  InputView.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 08/10/2023.
//

import UIKit

struct Input {
    var title: String
    var typeInput: TypeInput
}

enum TypeInput {
    case none
    case email
    case password
    case numberPhone
    case code
}

protocol InputViewEvents: AnyObject {
    func typeInput() -> Input
}

class InputView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    weak var delegate: InputViewEvents?
    
    private var input = Input(title: "", typeInput: .none)
    
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
            input = delegate?.typeInput() ?? Input(title: "", typeInput: .none)
        }
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        if !input.title.isEmpty {
            titleLabel.text = input.title
        }
    }
    
    private func setupUI() { }
}

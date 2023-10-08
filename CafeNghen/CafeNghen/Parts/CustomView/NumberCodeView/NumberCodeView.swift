//
//  NumberCodeView.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 08/10/2023.
//

import UIKit

protocol NumberCodeViewEvents: AnyObject {
    func isResendCode() -> Bool
    func tapped(isResendCode: Bool)
}

class NumberCodeView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var resentButton: UIButton!
    
    weak var delegate: NumberCodeViewEvents?
    
    private var isResendCode: Bool = false
    
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
            isResendCode = delegate?.isResendCode() ?? false
        }
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        if isResendCode {
            resentButton.isHidden = false
        }
    }
    
    private func setupUI() { 
        resentButton.isHidden = true
    }
    
}

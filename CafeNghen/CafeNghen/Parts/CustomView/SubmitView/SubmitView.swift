//
//  SubmitView.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 08/10/2023.
//

import UIKit

class SubmitView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    override init (frame: CGRect){
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }
    
    override func draw(_ rect: CGRect) {

    }
    
    private func commitInit() {
        Bundle.main.loadNibNamed(className.self, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        setupUI()
    }
    
    func reloadView() {

        self.setNeedsDisplay()
    }
    
    private func setupUI() {
        submitButton.setTitle("", for: .normal)
    }

    @IBOutlet weak var submitTapped: UIButton!
}

//
//  DetailViewController.swift
//  CafeNghen
//
//  Created by Văn Khánh Vương on 05/10/2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var sliderView: SliderView!
    @IBOutlet weak var productNameView: ProductNameView!
    @IBOutlet weak var dropDownView: DropDownView!
    @IBOutlet weak var addCartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        dropDownView.config(title: "Description:", content: "This is the product description...")
        addCartButton.configUIForButton(title: "Add to Cart", backgroundColor: .systemGreen, radius: 15)
    }
}

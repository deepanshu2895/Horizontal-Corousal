//
//  CurrencyPicker.swift
//  Task
//
//  Created by Deepanshu Jain on 10/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

import Foundation

class CurrencyPicker: UIView {
	@IBOutlet weak private var containerView: UIView!
	@IBOutlet weak private var picker: UILabel!
	@IBOutlet weak private var currencyLabel: UILabel!
	
	var delegate: PickerCellProtocol?
	var currency: String = K.Strings.emptyString {
		didSet {
			updateUI()
		}
	}
	
	private func updateUI() {
		currencyLabel.text = currency
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setupDefaults()
		addTapGesture()
	}
	
	private func setupDefaults() {
		layer.cornerRadius = K.Dimensions.cornerRadius
		currencyLabel.text = K.Strings.defaultCurrency
		picker.text = K.Strings.currencyPickerText
	}
	
	private func addTapGesture() {
		let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        containerView.isUserInteractionEnabled = true
        containerView.addGestureRecognizer(labelTap)
	}
	
	@objc func labelTapped(_ sender: UITapGestureRecognizer) {
		delegate?.presentCurrencyActionSheet(currentCurrency: currencyLabel.text!, price: nil)
    }
	
	//MARK: - Registering Nib
	override init(frame: CGRect) {
		super.init(frame: frame)
		commitInit()
	}
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commitInit()
	}
	private func commitInit() {
		Bundle.main.loadNibNamed(K.Nib.currencyPicker, owner: self, options: nil)
		addSubview(containerView)
		containerView.frame = self.bounds
		containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
	}
}

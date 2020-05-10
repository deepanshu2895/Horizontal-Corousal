//
//  ItemCell.swift
//  Task
//
//  Created by Deepanshu Jain on 09/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
	@IBOutlet weak private var imgView: UIImageView!
	@IBOutlet weak private var footerView: FooterView!
	@IBOutlet weak private var currencyPicker: CurrencyPicker!
	
	var delegate: CellPresenterProtocol?
	var viewModel: ProductObject? = nil {
		didSet {
			updateUI()
		}
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		imgView.image = nil
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setupDefaults()
	}
	
	private func setupDefaults() {
		currencyPicker.delegate = self
		layer.cornerRadius = K.Dimensions.cornerRadius
		imgView.layer.cornerRadius = K.Dimensions.cornerRadius
		imgView.image = UIImage(named: K.Strings.placeHolderImage)
	}
	
	private func updateUI() {
		guard let viewModel = viewModel else { return }
		if let url = URL(string: viewModel.url) {
			imgView.sd_setImage(with: url, placeholderImage: UIImage(named: K.Strings.placeHolderImage))
			self.imgView.image = self.imgView.image?.withRoundedCorners(radius: 16)
		}
		footerView.viewModel = Footer(title: viewModel.name, subtitle: viewModel.price)
		currencyPicker.currency = viewModel.currency
	}
}

//MARK: - PickerCellProtocol Methods
extension ItemCell: PickerCellProtocol {
	func presentCurrencyActionSheet(currentCurrency: String, price: String?) {
		delegate?.presentCurrencyActionSheet(currentCurrency: currentCurrency, price: footerView.priceLabel.text!)
	}
}

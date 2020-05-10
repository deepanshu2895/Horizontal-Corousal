//
//  FooterView.swift
//  Task
//
//  Created by Deepanshu Jain on 09/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

import Foundation

class FooterView: UIView {
	@IBOutlet weak private var containerView: UIView!
	@IBOutlet weak private var descriptionLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	
	var viewModel: Footer? = nil {
		didSet {
			updateUI()
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setupDefaults()
	}
	
	private func setupDefaults() {
		descriptionLabel.text = nil
		priceLabel.text = nil
		layer.cornerRadius = K.Dimensions.cornerRadius
		containerView.layer.cornerRadius = K.Dimensions.cornerRadius
	}
	
	private func updateUI() {
		guard let viewModel = viewModel else { return }
		descriptionLabel.text = viewModel.title
		priceLabel.text = viewModel.subtitle
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
		Bundle.main.loadNibNamed(K.Nib.footerView, owner: self, options: nil)
		addSubview(containerView)
		containerView.frame = self.bounds
		containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
	}
}

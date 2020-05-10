//
//  HeaderView.swift
//  Task
//
//  Created by Deepanshu Jain on 09/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

import Foundation

class HeaderView: UIView {
	@IBOutlet weak private var containerView: UIView!
	@IBOutlet weak private var titleLabel: UILabel!
	
	var viewModel: Header? = nil {
		didSet {
			updateUI()
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		titleLabel.text = nil
	}
	
	private func updateUI() {
		guard let viewModel = viewModel else { return }
		titleLabel.text = viewModel.title
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
		Bundle.main.loadNibNamed(K.Nib.headerView, owner: self, options: nil)
		addSubview(containerView)
		containerView.frame = self.bounds
		containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
	}
}

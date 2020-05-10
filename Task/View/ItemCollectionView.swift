//
//  ItemCollectionView.swift
//  Task
//
//  Created by Deepanshu Jain on 09/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

import UIKit

class ItemCollectionView: UICollectionView {
	@IBOutlet weak private var collectionView: UICollectionView!
	
	var presenter: ViewOutputProtocol?
	
	override func awakeFromNib() {
		setupDefaults()
		collectionView.register(UINib(nibName: K.Nib.collectionViewCell, bundle: nil), forCellWithReuseIdentifier: K.Nib.collectionViewCell)
	}
	
	private func setupDefaults() {
		collectionView.isPagingEnabled = true
		collectionView.dataSource = self
		setCollectionViewLayout()
	}
	
	private func setCollectionViewLayout() {
		let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
		layout?.itemSize = K.Dimensions.itemSize
	}
	
	//MARK: - Registering Nib
	override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
		super.init(frame: frame, collectionViewLayout: layout)
		commitInit()
	}
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commitInit()
	}
	private func commitInit() {
		Bundle.main.loadNibNamed(K.Nib.collectionView, owner: self, options: nil)
		addSubview(collectionView)
		collectionView.frame = self.bounds
		collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
	}
}

//MARK: - UICollectionViewDataSource Methods
extension ItemCollectionView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return presenter?.getProductsViewModel().count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return presenter?.getCellAtSection(indexPath: indexPath, collectionView: collectionView) ?? UICollectionViewCell()
	}
	
}

extension ItemCollectionView {
	func getVisibleCellIndex() -> Int? {
		let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
		let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
		let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint)
		return visibleIndexPath?.row
	}
	
	func reloadView() {
		collectionView.reloadData()
	}
}

//
//  Protocols.swift
//  Task
//
//  Created by Deepanshu Jain on 10/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

import Foundation

protocol PickerCellProtocol {
	func presentCurrencyActionSheet(currentCurrency: String, price: String?)
}

protocol CellPresenterProtocol {
	func presentCurrencyActionSheet(currentCurrency: String, price: String)
}

protocol ViewInputProtocol: AnyObject {
	func getVisibleCellIndex() -> Int?
	func presentCurrencyActionSheet(currentCurrency: String, price: String)
	func passingItemData(data: ItemData)
	func reloadCollectionView()
}
protocol ViewOutputProtocol: AnyObject {
	func viewDidLoad()
	func updateModels(with currency: String)
	func setViewModels(productsViewModel: [ProductObject], currencyViewModel: [ConversionObject])
	func getProductsViewModel() -> [ProductObject]
	func updateModel(with price: String, and currency: String, at index: Int)
	func getConvertPrice(from currentCurrency: String, to updatedCurrency: String, at index: Int) -> String
	func getCurrenciesList() -> Set<String>
	func getCellAtSection(indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell?
}

protocol InteractorInputProtocol: AnyObject {
	func makeAPICall()
}
protocol InteractorOutputProtocol: AnyObject {
	func updateData(data: ItemData)
	func apiCallFailed(withError error: Error?)
}

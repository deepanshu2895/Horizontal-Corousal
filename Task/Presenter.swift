//
//  Presenter.swift
//  Task
//
//  Created by Deepanshu Jain on 10/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

import Foundation

class Presenter {
	weak var view: ViewInputProtocol?
	var interactor: InteractorInputProtocol?
	
	private var currencies = Set<String>()
	var productsViewModel: [ProductObject] = [] {
		didSet {
			view?.reloadCollectionView()
		}
	}
	var currencyViewModel = [ConversionObject]()
	var currentCurrency: String = K.Strings.emptyString
	
	private func setViewModels(data: ItemData) {
		setViewModels(productsViewModel: data.products, currencyViewModel: data.conversion)
		view?.passingItemData(data: data)
	}
}

//MARK: - InteractorOutputProtocol Methoda
extension Presenter: InteractorOutputProtocol {
	func updateData(data: ItemData) {
		for currency in data.conversion {
			currencies.insert(currency.from)
		}
		setViewModels(data: data)
		view?.reloadCollectionView()
	}
	
	func apiCallFailed(withError error: Error?) {
		print(error?.localizedDescription ?? K.Strings.emptyString)
	}
}

//MARK: - CellPresenterProtocol Methods
extension Presenter: CellPresenterProtocol {
	func presentCurrencyActionSheet(currentCurrency: String, price: String) {
		self.currentCurrency = currentCurrency
		view?.presentCurrencyActionSheet(currentCurrency: currentCurrency, price: price)
	}
}

//MARK: - ViewOutputProtocol Methods
extension Presenter: ViewOutputProtocol {
	func viewDidLoad() {
		interactor?.makeAPICall()
	}
	
	func updateModels(with currency: String) {
		guard let currentVisibleIndex = view?.getVisibleCellIndex() else { return }
		let updatedPrice = getConvertPrice(from: currentCurrency, to: currency, at: currentVisibleIndex)
		updateModel(with: updatedPrice, and: currency, at: currentVisibleIndex)
		view?.reloadCollectionView()
	}
	
	func setViewModels(productsViewModel: [ProductObject], currencyViewModel: [ConversionObject]) {
		self.productsViewModel = productsViewModel
		self.currencyViewModel = currencyViewModel
	}
	
	func getProductsViewModel() -> [ProductObject] {
		return productsViewModel
	}
	
	func updateModel(with price: String, and currency: String, at index: Int) {
		productsViewModel[index].price = price
		productsViewModel[index].currency = currency
	}
	
	func getConvertPrice(from currentCurrency: String, to updatedCurrency: String, at index: Int) -> String {
		for entry in currencyViewModel {
			if entry.from == currentCurrency && entry.to == updatedCurrency {
				let rate: Double = Double(entry.rate)!
				let price: Double = Double(productsViewModel[index].price)!
				var result = price * rate
				result = result.rounded(toPlaces: 2)
				let resultString = String(result)
				return resultString
			}
		}
		return productsViewModel[index].price
	}
	
	func getCurrenciesList() -> Set<String> {
		return currencies
	}
	
	func getCellAtSection(indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell? {
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Nib.collectionViewCell, for: indexPath) as? ItemCell {
			cell.delegate = self
			cell.viewModel = productsViewModel[indexPath.row]
			return cell
		}
		return UICollectionViewCell()
	}
}

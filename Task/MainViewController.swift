//
//  MainViewController.swift
//  Task
//
//  Created by Deepanshu Jain on 09/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	@IBOutlet weak private var headerView: HeaderView!
	@IBOutlet weak private var collectionView: ItemCollectionView!
	
	var presenter: ViewOutputProtocol?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter?.viewDidLoad()
		collectionView.presenter = presenter
	}
}

//MARK: - Currency Action Sheet Methods
extension MainViewController {
	func presentCurrencyActionSheet(currentCurrency: String, price: String) {
		let alert = UIAlertController(title: K.Strings.alertTitle, message: nil, preferredStyle: .actionSheet)
		for currency in (presenter?.getCurrenciesList())! {
			let action = getAction(title: currency, alertController: alert)
			alert.addAction(action)
		}
		let dismissAction = UIAlertAction(title: K.Strings.dismiss, style: .cancel, handler: nil)
		alert.addAction(dismissAction)
		self.present(alert, animated: true)
	}
	
	private func getAction(title: String, alertController: UIAlertController) -> UIAlertAction {
		let action = UIAlertAction(title: title, style: .default) {
			(alert: UIAlertAction!) -> Void in
			self.presenter?.updateModels(with: title)
		}
		return action
	}
}

//MARK: - ViewInputProtocol Methods
extension MainViewController: ViewInputProtocol {
	func passingItemData(data: ItemData) {
		DispatchQueue.main.async {
			self.headerView.viewModel = Header(title: data.title)
		}
	}
	
	func reloadCollectionView() {
		collectionView.reloadView()
	}
	
	func getVisibleCellIndex() -> Int? {
		collectionView.getVisibleCellIndex()
	}
}

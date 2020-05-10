//
//  APIManager.swift
//  Task
//
//  Created by Deepanshu Jain on 08/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

class Interactor {
	weak var presenter: InteractorOutputProtocol?
	
	private func loadJson(filename fileName: String) -> ItemData? {
		if let url = Bundle.main.url(forResource: fileName, withExtension: K.Strings.jsonExtension) {
			do {
				let data = try Data(contentsOf: url)
				let decoder = JSONDecoder()
				let jsonData = try decoder.decode(ItemData.self, from: data)
				return jsonData
			} catch {
				presenter?.apiCallFailed(withError: error)
			}
		}
		return nil
	}
}

//MARK: - InteractorInputProtocol Methods
extension Interactor: InteractorInputProtocol {
	func makeAPICall() {
		guard let data = loadJson(filename: K.Strings.jsonFilename) else { return }
		let item = ItemData(conversion: data.conversion, title: data.title, products: data.products)
		presenter?.updateData(data: item)
	}
}

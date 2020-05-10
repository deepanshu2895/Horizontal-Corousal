//
//  ItemData.swift
//  Task
//
//  Created by Deepanshu Jain on 08/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

struct ItemData: Codable {
	let conversion: [ConversionObject]
	let title: String
	let products: [ProductObject]
}

struct ConversionObject: Codable {
	let from: String
	let to: String
	let rate: String
}

struct ProductObject: Codable {
	let url: String
	let name: String
	var price: String
	var currency: String
}

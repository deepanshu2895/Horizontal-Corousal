//
//  Constants.swift
//  Task
//
//  Created by Deepanshu Jain on 09/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

class K {
	struct Nib {
		static let mainVC: String = "MainViewController"
		static let headerView: String = "HeaderView"
		static let footerView: String = "FooterView"
		static let collectionView: String = "ItemCollectionView"
		static let collectionViewCell: String = "ItemCell"
		static let currencyPicker: String = "CurrencyPicker"
	}
	
	struct Strings {
		static let doubleZeroes: String = ".00"
		static let emptyString: String = ""
		static let jsonFilename: String = "demo"
		static let jsonExtension: String = "json"
		static let placeHolderImage: String = "PlaceHolderImage"
		static let currencyPickerText: String = "CURRENCY" + " \u{2193}"
		static let alertTitle: String = "Choose Currency"
		static let defaultCurrency: String = "INR"
		static let dismiss: String = "Dismiss"
	}
	struct Dimensions {
		static let screenWidth: CGFloat = UIScreen.main.bounds.width
		
		static let cornerRadius: CGFloat = 24.0
		static let cellWidthScale: CGFloat = 1
		static let cellHeightScale: CGFloat = 0.8
		static let headerHeight: CGFloat = 60.0
		
		static let screenSize: CGSize = UIScreen.main.bounds.size
		static let cellWidth: CGFloat = floor(screenSize.width * K.Dimensions.cellWidthScale)
		static let cellHeight: CGFloat = floor(screenSize.height * K.Dimensions.cellHeightScale)
		static let itemSize: CGSize = CGSize(width: K.Dimensions.cellWidth, height: K.Dimensions.cellHeight)
	}
}

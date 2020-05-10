//
//  Configurator.swift
//  Task
//
//  Created by Deepanshu Jain on 10/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

import Foundation

class Configurator {
	static func getMainViewController() -> MainViewController {
		let viewController = MainViewController()
		let presenter = Presenter()
		let interactor = Interactor()
		
		viewController.presenter = presenter
		presenter.view = viewController
		presenter.interactor = interactor
		interactor.presenter = presenter
		
		return viewController
	}
}

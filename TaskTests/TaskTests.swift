//
//  TaskTests.swift
//  TaskTests
//
//  Created by Deepanshu Jain on 10/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

import XCTest
@testable import Task

class TaskTests: XCTestCase {
	//target
	var presenter: Presenter!
	
	//Mocks
	var view: ViewInputProtocol?
	var interactor: InteractorInputProtocol?
	
    override func setUp() {
		super.setUp()
		config()
    }

    override func tearDown() {
		super.tearDown()
		cleanUp()
    }
	
	func config() {
        presenter = Presenter()
        interactor = Interactor()
        view = MainViewController()

        presenter.view = view
        presenter.interactor = interactor
    }
	
	func cleanUp() {
        view = nil
        interactor = nil
        presenter = nil
    }

}

extension TaskTests {
	
}

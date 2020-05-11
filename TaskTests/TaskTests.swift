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
	var presenter: Presenter!
	
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
	
	func testInfoLoading() {
		guard let interactor = interactor else {
			XCTAssert(false, K.TestingConstants.interactorNotInstantiated)
			return
		}
		interactor.makeAPICall()
		
		let pred = NSPredicate(format: "\(presenter.productsViewModel.count) == 0")
		let exp = expectation(for: pred, evaluatedWith: presenter.productsViewModel.count, handler: nil)
		let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
		XCTAssert(result == XCTWaiter.Result.completed, K.TestingConstants.apiCallFailed)
	}
	
}

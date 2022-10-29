//
//  AddViewModelTest.swift
//  TimeTrackerAppTests
//
//  Created by Sevda Gul Baran on 16.10.2022.
//

import XCTest
@testable import TimeTrackerApp

final class AddViewModelTest: XCTest {
    
    private var viewModel: AddViewModel!
    private var view: MockAddViewController!
    private var storeManager: MockDataManipulation!
    
    override func setUp() {
        super.setUp()
        view = .init()
        storeManager = .init()
        viewModel = .init(view: view, storeManager: storeManager)
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func test_addButtonTapped_InvokesRequiredMethods() {
        XCTAssertFalse(view.invokedSetSubCategoryTitle)
        XCTAssertFalse(view.invokedConfigureActionSelectMainCategory)
        XCTAssertFalse(view.invokedConfigureActionSelectIcon)
        XCTAssertFalse(view.invokedSetSubCategoryTitle)
        XCTAssertFalse(view.invokedSetTabBarControllerSelectedIndex)
        XCTAssertFalse(view.invokedShowToast)
        
        viewModel.addButtonTapped()
        
        XCTAssertEqual(view.invokedSetSubCategoryTitleCount,1)
        XCTAssertEqual(view.invokedConfigureActionSelectMainCategoryCount,1)
        XCTAssertEqual(view.invokedConfigureActionSelectIconCount,1)
        XCTAssertEqual(view.invokedSetSubCategoryTitleCount,1)
        XCTAssertEqual(view.invokedSetTabBarControllerSelectedIndexCount,1)
        XCTAssertEqual(view.invokedShowToastCount,1)
    }
}

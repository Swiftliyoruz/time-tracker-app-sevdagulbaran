//
//  HomeViewModelTests.swift
//  TimeTrackerAppTests
//
//  Created by Sevda Gul Baran on 13.10.2022.
//

import XCTest
@testable import TimeTrackerApp

final class HomeViewModelTests: XCTestCase {
    private var viewModel: HomeViewModel!
    private var view: MockHomeVievController!
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
    
    func test_viewDidLoad_InvokesRequiredMethods() {

        XCTAssertFalse(view.invokedSetupUI)
        XCTAssertFalse(view.invokedRegisterCollectionView)
        XCTAssertFalse(view.invokedTabbarConfig)
        
        viewModel.viewDidLoad()

        XCTAssertEqual(view.invokedSetupUICount, 1)
        XCTAssertEqual(view.invokedRegisterCollectionViewCount, 1)
        XCTAssertEqual(view.invokedTabbarConfigCount, 1)
       
    }
    
    func test_viewWillAppear_InvokesRequiredMethods() {
        // GIVEN
        XCTAssertFalse(view.invokedReloadData)
        XCTAssertFalse(storeManager.invokedFetchTasks)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 0)
        
        // WHEN
        viewModel.viewWillAppear()
        
        // THEN
        XCTAssertEqual(view.invokedReloadDataCount, 1)
        XCTAssertEqual(storeManager.invokedFetchTasksCount, 1)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 0)
        XCTAssertEqual(viewModel.cellForItem(indexPath: .init(row: 0, section: 0)), nil)
    }
    
    func test_viewWillAppear_With100_InvokesRequiredMethods() {
        // GIVEN
        XCTAssertFalse(view.invokedReloadData)
        XCTAssertFalse(storeManager.invokedFetchTasks)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 0)
        
        // WHEN
        viewModel.viewWillAppear()
        
        // THEN
        XCTAssertEqual(view.invokedReloadDataCount, 1)
        XCTAssertEqual(storeManager.invokedFetchTasksCount, 1)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 0)
        XCTAssertEqual(viewModel.cellForItem(indexPath: .init(row: 100, section: 0)), nil)
    }
    
    func test_viewWillAppear_WithTasks_InvokesRequiredMethods() {
        XCTAssertFalse(view.invokedReloadData)
        XCTAssertFalse(storeManager.invokedFetchTasks)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 0)
        
        let task = Task()
        storeManager.stubbedFetchTasks = [task]
        viewModel.viewWillAppear()
        
        XCTAssertEqual(view.invokedReloadDataCount, 1)
        XCTAssertEqual(storeManager.invokedFetchTasksCount, 1)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 1)
        XCTAssertNotNil(viewModel.cellForItem(indexPath: .init(row: 0, section: 0)))
    }
}

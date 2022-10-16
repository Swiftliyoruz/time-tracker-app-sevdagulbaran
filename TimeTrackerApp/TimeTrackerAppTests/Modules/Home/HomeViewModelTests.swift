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
    private var delegate: MockHomeVievController!
    private var storeManager: MockDataManipulation!
   
    override func setUp() {
        super.setUp()
        delegate = .init()
        storeManager = .init()
        viewModel = .init(delegate: delegate, storeManager: storeManager)
        
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func test_viewDidLoad_InvokesRequiredMethods() {

        XCTAssertFalse(delegate.invokedSetupUI)
        XCTAssertFalse(delegate.invokedRegisterCollectionView)
        XCTAssertFalse(delegate.invokedTabbarConfig)
        
        viewModel.viewDidLoad()

        XCTAssertEqual(delegate.invokedSetupUICount, 1)
        XCTAssertEqual(delegate.invokedRegisterCollectionViewCount, 1)
        XCTAssertEqual(delegate.invokedTabbarConfigCount, 1)
       
    }
    
    func test_viewWillAppear_InvokesRequiredMethods() {
        // GIVEN
        XCTAssertFalse(delegate.invokedReloadData)
        XCTAssertFalse(storeManager.invokedFetchTasks)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 0)
        
        // WHEN
        viewModel.viewWillAppear()
        
        // THEN
        XCTAssertEqual(delegate.invokedReloadDataCount, 1)
        XCTAssertEqual(storeManager.invokedFetchTasksCount, 1)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 0)
        XCTAssertEqual(viewModel.cellForItem(indexPath: .init(row: 0, section: 0)), nil)
    }
    
    func test_viewWillAppear_With100_InvokesRequiredMethods() {
        // GIVEN
        XCTAssertFalse(delegate.invokedReloadData)
        XCTAssertFalse(storeManager.invokedFetchTasks)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 0)
        
        // WHEN
        viewModel.viewWillAppear()
        
        // THEN
        XCTAssertEqual(delegate.invokedReloadDataCount, 1)
        XCTAssertEqual(storeManager.invokedFetchTasksCount, 1)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 0)
        XCTAssertEqual(viewModel.cellForItem(indexPath: .init(row: 100, section: 0)), nil)
    }
    
    func test_viewWillAppear_WithTasks_InvokesRequiredMethods() {
        XCTAssertFalse(delegate.invokedReloadData)
        XCTAssertFalse(storeManager.invokedFetchTasks)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 0)
        
        let task = Task()
        storeManager.stubbedFetchTasks = [task]
        viewModel.viewWillAppear()
        
        XCTAssertEqual(delegate.invokedReloadDataCount, 1)
        XCTAssertEqual(storeManager.invokedFetchTasksCount, 1)
        XCTAssertEqual(viewModel.numberOfItemsInSection, 1)
        XCTAssertNotNil(viewModel.cellForItem(indexPath: .init(row: 0, section: 0)))
    }
}

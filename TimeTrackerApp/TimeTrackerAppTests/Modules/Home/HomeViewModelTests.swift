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
    
    func test_viewDidAppear_InvokesRequiredMethods() {
        XCTAssertFalse(delegate.invokedReloadData)
        //- err
        //XCTAssertFalse(storeManager.invokedFetchTasks)
        
        viewModel.viewWillAppear()
        
        XCTAssertEqual(delegate.invokedReloadDataCount, 1)
        //XCTAssertEqual(storeManager.invokedCreateTaskCount, 1)
    }
}

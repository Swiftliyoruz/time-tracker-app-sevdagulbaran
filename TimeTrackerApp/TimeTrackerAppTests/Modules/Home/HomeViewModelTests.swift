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
   
    override func setUp() {
        super.setUp()
        delegate = .init()
        
        viewModel = .init(delegate: delegate)
        
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func test_viewDidLoad_InvokesRequiredMethods() {

        XCTAssertFalse(delegate.invokedSetupUI)
        XCTAssertFalse(delegate.invokedRegisterCollectionView)
        XCTAssertFalse(delegate.invokedTabbarConfig)
        XCTAssertFalse(delegate.invokedReloadData)
        
        viewModel.viewDidLoad()

        XCTAssertEqual(delegate.invokedSetupUICount, 1)
        XCTAssertEqual(delegate.invokedRegisterCollectionViewCount, 1)
        XCTAssertEqual(delegate.invokedTabbarConfigCount, 1)
        // To-Do: Reloadda test hata verdi
        XCTAssertEqual(delegate.invokedReloadDataCount, 1)
    }
}

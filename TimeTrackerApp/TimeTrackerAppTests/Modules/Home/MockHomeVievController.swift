//
//  MockHomeVievController.swift
//  TimeTrackerAppTests
//
//  Created by Sevda Gul Baran on 13.10.2022.
//

@testable import TimeTrackerApp

final class MockHomeVievController: HomeViewInterface {
    
    var invokedTabbarConfig =  false
    var invokedTabbarConfigCount = 0
    
    func tabbarConfig() {
        invokedTabbarConfig = true
        invokedTabbarConfigCount += 1
    }
    
    var invokedSetupUI =  false
    var invokedSetupUICount = 0
    
    func setupUI() {
        invokedSetupUI =  true
        invokedSetupUICount += 1
    }
    var invokedRegisterCollectionView =  false
    var invokedRegisterCollectionViewCount = 0
    
    func registerCollectionView() {
        invokedRegisterCollectionView =  true
        invokedRegisterCollectionViewCount += 1
    }
    
    var  invokedReloadData =  false
    var  invokedReloadDataCount = 0
    
    func reloadData() {
        invokedReloadData =  true
        invokedReloadDataCount += 1
    }
    
    var invokedMoreButtonTapped =  false
    var invokedMoreButtonTappedCount = 0
    
    func moreButtonTapped() {
        invokedMoreButtonTapped = true
        invokedMoreButtonTappedCount = 1
    }
}

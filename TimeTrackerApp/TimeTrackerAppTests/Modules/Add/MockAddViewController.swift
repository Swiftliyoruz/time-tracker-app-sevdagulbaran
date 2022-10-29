//
//  MockAddViewController.swift
//  TimeTrackerAppTests
//
//  Created by Sevda Gul Baran on 16.10.2022.
//

@testable import TimeTrackerApp
import Foundation

final class MockAddViewController: AddViewInterface {
    var titleText: String? = ""
    
    var subCategoryText: String? = ""
    
    var selectedMainCategoryTitle: String? = ""
    
    var selectedImageButtonImageData: Data? = nil
    
    var invokedConfigureActionSelectMainCategory =  false
    var invokedConfigureActionSelectMainCategoryCount = 0
    
    func configureActionSelectMainCategory() {
        invokedConfigureActionSelectMainCategory = true
        invokedConfigureActionSelectMainCategoryCount += 1
    }
    var invokedConfigureActionSelectIcon =  false
    var invokedConfigureActionSelectIconCount = 0
    
    func configureActionSelectIcon() {
        invokedConfigureActionSelectIcon = true
        invokedConfigureActionSelectIconCount += 1
    }
    var invokedSetTaskTitle =  false
    var invokedSetTaskTitleCount = 0
    
    func setTaskTitle(text: String) {
        invokedSetTaskTitle = true
        invokedSetTaskTitleCount = 1
    }
    var invokedSetSubCategoryTitle =  false
    var invokedSetSubCategoryTitleCount = 0
    
    func setSubCategoryTitle(text: String) {
        invokedSetSubCategoryTitle = true
        invokedSetSubCategoryTitleCount = 1
    }
    var invokedSetTabBarControllerSelectedIndex =  false
    var invokedSetTabBarControllerSelectedIndexCount = 0
    
    func setTabBarControllerSelectedIndex(_ index: Int) {
        invokedSetTabBarControllerSelectedIndex = true
        invokedSetTabBarControllerSelectedIndexCount = 1
        
    }
    var invokedShowToast =  false
    var invokedShowToastCount = 0
    
    func showToast(message: String) {
        invokedShowToast = true
        invokedShowToastCount = 1
    }
}

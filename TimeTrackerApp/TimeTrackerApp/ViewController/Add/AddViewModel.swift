//
//  AddViewModel.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 25.09.2022.
//

import Foundation

protocol AddViewModelInterface {
    var view: AddViewInterface? { get set }
    
    func viewDidLoad()
    func addButtonTapped()
}

final class AddViewModel {
    weak var view: AddViewInterface?
}

extension AddViewModel: AddViewModelInterface {
    func viewDidLoad() {
        view?.configureActionSelectMainCategory()
        view?.configureActionSelectIcon()
    }
    
    func addButtonTapped() {
        if let title = view?.titleText,
            !title.isEmpty,
           let subCategory = view?.subCategoryText,
            !subCategory.isEmpty {
            
            guard let context = DataManipulation().context else { return }
            let newTask = Task(context: context)
            newTask.taskTitle = title
            newTask.mainCategory = view?.selectedMainCategoryTitle
            newTask.subCategory = subCategory
            newTask.taskIcon = view?.seledtedImageButtonImageData
            
            DataManipulation().createTask()
        } else {
            
            view?.showToast(message: "Fill in all the fields.")
        }
    }
}

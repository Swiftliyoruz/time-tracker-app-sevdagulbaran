//
//  CustomTaskCellViewModel.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 24.09.2022.
//

import Foundation

protocol CustomTaskCellViewModelInterface {
    var view: CustomTaskCellInterface? { get set }
    
    func awakeFromNib()
    func playButtonTapped()
}

final class CustomTaskCellViewModel {
    weak var view: CustomTaskCellInterface?
}

extension CustomTaskCellViewModel: CustomTaskCellViewModelInterface {
    func awakeFromNib() {
        view?.setupUI()
    }
    
    func playButtonTapped() {
        print("tapped")
    }
}

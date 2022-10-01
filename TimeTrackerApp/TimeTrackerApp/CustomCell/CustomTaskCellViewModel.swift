//
//  CustomTaskCellViewModel.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 24.09.2022.
//

import Foundation


protocol CustomTaskCellViewModelDelegate: AnyObject {
    func setupUI()
 
}

protocol CustomTaskCellViewModelInterface {
    var delegate: CustomTaskCellViewModelDelegate? { get set}
    
    func viewDidLoad()
    func playButtonTapped()
}

final class CustomTaskCellViewModel {
    weak var delegate: CustomTaskCellViewModelDelegate?
}

extension CustomTaskCellViewModel: CustomTaskCellViewModelInterface {
    func viewDidLoad() {
        delegate?.setupUI()
    
    }
    func playButtonTapped() {
        print("tapped")
    }
}

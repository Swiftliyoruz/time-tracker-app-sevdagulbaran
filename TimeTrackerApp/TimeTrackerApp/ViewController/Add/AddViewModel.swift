//
//  AddViewModel.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 25.09.2022.
//

import Foundation

protocol AddViewModelDelegate: AnyObject {
    
    func setupUI()
    func configureActionSelectMainCategory()
    func configureActionSelectIcon()
    func configureAddButton()
}
protocol AddViewModelInterface {
    var delegate: AddViewModelDelegate? { get set}
    
    func viewDidLoad()
    func addButtonTapped()
}

final class AddViewModel {
    weak var delegate: AddViewModelDelegate?
}

extension AddViewModel: AddViewModelInterface {
    
    func viewDidLoad() {
        delegate?.setupUI()
        delegate?.configureActionSelectMainCategory()
        delegate?.configureActionSelectIcon()
    }
    
    func addButtonTapped() {
        delegate?.configureAddButton()
    }
}

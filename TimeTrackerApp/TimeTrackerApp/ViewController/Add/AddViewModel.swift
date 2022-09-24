//
//  AddViewModel.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 24.09.2022.
//

import Foundation


protocol AddViewModelDelegate: AnyObject {
    func setupUI()
}

protocol AddViewModelInterface {
    var delegate: AddViewModelDelegate? { get set}
    
    func viewDidLoad()
    func finishButtonTapped()
    func quitButtonTapped()
}

final class AddViewModel {
    weak var delegate: AddViewModelDelegate?
}

extension AddViewModel: AddViewModelInterface {
    func viewDidLoad() {
        delegate?.setupUI()
    }
    
    func finishButtonTapped() {
        print("tapped")
    }
    
    func quitButtonTapped() {
        print("tapped")
    }
}

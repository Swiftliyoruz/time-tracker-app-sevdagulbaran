//
//  ReportViiewModel.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 24.09.2022.
//

import Foundation

protocol ReportViewModelDelegate: AnyObject {
    func setupUI()
}

protocol ReportViewModelInterface {
    var delegate: ReportViewModelDelegate? { get set}
    
    func viewDidLoad()
}

final class ReportViewModel {
    weak var delegate: ReportViewModelDelegate?
}

extension ReportViewModel: ReportViewModelInterface {
    func viewDidLoad() {
        delegate?.setupUI()
    }
}

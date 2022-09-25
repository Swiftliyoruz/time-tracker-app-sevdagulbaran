//
//  AddViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 25.09.2022.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet private weak var taskTitleTextField: UITextField!
    @IBOutlet private weak var selectImageButtton: UIButton!
    @IBOutlet private weak var selectMainCategoryButton: UIButton!
    @IBOutlet private weak var subCategoryTextField: UITextField!
    
    private lazy var viewModel: AddViewModelInterface = AddViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate =  self
        viewModel.viewDidLoad()
        
        
    }
}
// MARK: - Actions

extension AddViewController {
    @IBAction func addButtonTapped(_ sender: Any) {
        viewModel.addButtonTapped()
    }
}

// MARK: - 
extension AddViewController: AddViewModelDelegate {
    func configureActionItemMenu() {
        selectMainCategoryButton.menu = UIMenu(title: "", children: [UIAction(title: "Option 1", handler: { (action) in
                print("Option 1 was selected")
            }), UIAction(title: "Option 2", handler: { (action) in
                print("Option 2 was selected")
            }), UIAction(title: "Option 3", handler: { (action) in
                print("Option 3 was selected")
            })])
        }
    
    func setupUI() {
        
    }
}

//
//  AddViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 25.09.2022.
//

import UIKit

final class AddViewController: UIViewController {
    
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

// MARK: - AddViewModelDelegate

extension AddViewController: AddViewModelDelegate {
    func configureActionSelectMainCategory() {
        selectMainCategoryButton.menu = UIMenu(title: "", children: [UIAction(title: "Selected Main Category", handler: { (action) in
            print("Selected Main Category")
        }), UIAction(title: "Personel", handler: { (action) in
            print("Personel was selected")
        }), UIAction(title: "Work", handler: { (action) in
            print("Work was selected")
        })])
        selectMainCategoryButton.showsMenuAsPrimaryAction = true
        selectMainCategoryButton.changesSelectionAsPrimaryAction = true
    }
    
    func setupUI() {
    }
}

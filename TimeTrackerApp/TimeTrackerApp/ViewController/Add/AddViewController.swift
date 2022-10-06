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
    
    func configureActionSelectIcon() {
        let taskIconClosure = { [self](action: UIAction) in
            self.selectImageButtton.setImage(action.image, for: .normal)
            print("Selected \(action.title)")
        }
        selectImageButtton.menu = UIMenu(children: [
            UIAction(title: "Select Icon ", handler: taskIconClosure),
            UIAction(
                title: Icons.TaskIconTitles.book,
                image: UIImage(named: Icons.TaskIconImages.book),
                handler: taskIconClosure
            ),
            UIAction(title: Icons.TaskIconTitles.code, image: UIImage(named: Icons.TaskIconImages.code), handler: taskIconClosure),
            UIAction(title: Icons.TaskIconTitles.monitor, image: UIImage(named: Icons.TaskIconImages.monitor), handler: taskIconClosure),
            UIAction(title: Icons.TaskIconTitles.sport, image: UIImage(named: Icons.TaskIconImages.sport), handler: taskIconClosure)
        ])
        selectImageButtton.showsMenuAsPrimaryAction = true
        selectImageButtton.changesSelectionAsPrimaryAction = true
    }
    
    func configureActionSelectMainCategory() {
        let mainCategoryClosure = {(action: UIAction ) in
            print("Selected \(action.title)")
        }
        selectMainCategoryButton.menu = UIMenu(children: [
            UIAction(title: "Select Main Category", handler: mainCategoryClosure),
            UIAction(title: MainCategories.personal, handler: mainCategoryClosure),
            UIAction(title: MainCategories.work, handler: mainCategoryClosure)
        ])
        
        selectMainCategoryButton.showsMenuAsPrimaryAction = true
        selectMainCategoryButton.changesSelectionAsPrimaryAction = true
    }
    
    func setupUI() {
        
    }
    func configureAddButton() {
        
        if taskTitleTextField.text != "" && subCategoryTextField.text != "" {
            guard let context = DataManipulation.context else { return }
            let newTask = Task(context: context )
            newTask.taskTitle = taskTitleTextField.text
            newTask.mainCategory = selectMainCategoryButton.currentTitle
            newTask.subCategory = subCategoryTextField.text
            newTask.taskIcon = selectImageButtton.currentImage?.jpegData(compressionQuality: 1.0)
            
            DataManipulation.shared.createTask(task: newTask)
            
            taskTitleTextField.text?.removeAll()
            subCategoryTextField.text?.removeAll()
            self.tabBarController?.selectedIndex = 0
        } else {
            CustomToastMessage.show(message: "Fill in all the fields.", bgColor: .lightGray, textColor: .grey2, labelFont: .toastMessageFont, showIn: .bottom, controller: self)
        }
    }
}

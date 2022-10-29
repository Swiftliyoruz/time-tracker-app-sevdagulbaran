//
//  AddViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 25.09.2022.
//

import UIKit

protocol AddViewInterface: AnyObject {
    var titleText: String? { get }
    var subCategoryText: String? { get }
    var selectedMainCategoryTitle: String? { get }
    var selectedImageButtonImageData: Data? { get }
    
    func configureActionSelectMainCategory()
    func configureActionSelectIcon()
    func setTaskTitle(text: String)
    func setSubCategoryTitle(text: String)
    func setTabBarControllerSelectedIndex(_ index: Int)
    func showToast(message: String)
}

final class AddViewController: UIViewController {
    @IBOutlet private weak var taskTitleTextField: UITextField!
    @IBOutlet private weak var selectImageButtton: UIButton!
    @IBOutlet private weak var selectMainCategoryButton: UIButton!
    @IBOutlet private weak var subCategoryTextField: UITextField!
    
    private lazy var viewModel: AddViewModelInterface = AddViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

extension AddViewController: AddViewInterface {
    var titleText: String? {
        taskTitleTextField.text
    }
    
    var subCategoryText: String? {
        subCategoryTextField.text
    }
    
    var selectedMainCategoryTitle: String? {
        selectMainCategoryButton.currentTitle
    }
    
    var selectedImageButtonImageData: Data? {
        selectImageButtton.currentImage?.jpegData(compressionQuality: 1.0)
    }
    
    func setTaskTitle(text: String) {
        taskTitleTextField.text = text
    }
    
    func setSubCategoryTitle(text: String) {
        subCategoryTextField.text = text
    }
    
    func setTabBarControllerSelectedIndex(_ index: Int) {
        tabBarController?.selectedIndex = index
    }
    
    func configureActionSelectIcon() {
        let taskIconClosure = { [self](action: UIAction) in
            self.selectImageButtton.setImage(action.image, for: .normal)
            print("Selected \(action.title)")
        }
        selectImageButtton.menu = UIMenu(children: [
            UIAction(title: "Select Icon", handler: taskIconClosure),
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
    
    func showToast(message: String) {
        CustomToastMessage.show(message: message,
                                bgColor: .lightGray,
                                textColor: .grey2,
                                labelFont: .toastMessageFont,
                                showIn: .bottom,
                                controller: self)
    }
}

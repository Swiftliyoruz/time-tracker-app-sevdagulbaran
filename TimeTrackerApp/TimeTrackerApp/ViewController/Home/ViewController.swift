//
//  ViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 5.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbarConfig()
    }
    
    func tabbarConfig(){
        guard let tabbar = self.tabBarController?.tabBar else { return }
        
        tabbar.tintColor = .blackBackground
        tabbar.unselectedItemTintColor = .lightBackground
        tabbar.layer.cornerRadius = 30
    }
}



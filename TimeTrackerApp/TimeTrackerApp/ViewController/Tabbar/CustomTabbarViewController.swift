//
//  CustomTabbarViewController.swift
//  TimeTrackerApp
//
//  Created by Sevda Gul Baran on 14.09.2022.
//

import UIKit
import FloatingTabBarController
class CustomTabbarViewController: FloatingTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    
        let imagesArrLarge = [UIImage(named: "fillTime"),UIImage(named: "add"),UIImage(named: "fill-pie-chart")]
   
        let imagesArrSmall = [UIImage(named: "time"),UIImage(named: "add"),UIImage(named: "pie-chart")]
   
         
                var count = 0
                
                tabBar.tintColor = .black
                tabBar.backgroundColor = .white
                
                viewControllers = (1...3).map { "Tab\($0)" }.map {
                    
                    let selected = imagesArrLarge[count]
                    let normal = imagesArrSmall[count]
                    let controller = storyboard!.instantiateViewController(withIdentifier: $0)
                    controller.title = $0
                
                    count  = count + 1
                    controller.floatingTabItem = FloatingTabItem(selectedImage: selected!, normalImage: normal! )
                    return controller
                }
         
         
         
    }
    

  

}

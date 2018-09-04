//
//  MainController.swift
//  DMusic
//
//  Created by Ledung95d on 9/5/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class MainController: UITabBarController {
 
    static let shared = MainController()
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeController = HomeController(nibName: "HomeController", bundle: nil)
        let searchController = SearchController(nibName: "SearchController", bundle: nil)
        
        let homeRootController = BaseNavigationController(rootViewController: homeController)
        let searchRootController = BaseNavigationController(rootViewController: searchController)
        
//        homeRootController.isNavigationBarHidden = true
//        searchRootController.isNavigationBarHidden = true
        
        setupForEachRootController(viewcontroller: homeController,
                                   navTitle: "Home",
                                   tabbarTitle: "Home",
                                   image: "home",
                                   selectedImage: "homeSelected")
        setupForEachRootController(viewcontroller: searchController,
                                   navTitle: "Tìm kiếm",
                                   tabbarTitle: "Tìm kiếm",
                                   image: "search",
                                   selectedImage: "searchSelected")
        self.viewControllers = [homeRootController, searchRootController]
        
        UITabBarItem.appearance()
            .setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for:.normal)
        
        UITabBarItem.appearance()
            .setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.mainGreen], for:.selected)
        self.tabBar.backgroundColor = UIColor.white
    }
    
    func setupForEachRootController(viewcontroller: UIViewController,
                                    navTitle: String, tabbarTitle: String,
                                    image: String,
                                    selectedImage: String) {
        viewcontroller.navigationItem.title = navTitle
        let unSelectedImage = UIImage(named: image)!.withRenderingMode(.alwaysOriginal)
        let selectedImage =  UIImage(named: selectedImage)!.withRenderingMode(.alwaysOriginal)
        
        viewcontroller.tabBarItem =
            UITabBarItem(title: tabbarTitle, image:unSelectedImage, selectedImage:  selectedImage)
    }

}

//
//  MainTabBarViewController.swift
//  TwitterClone
//
//  Created by 上條栞汰 on 2022/10/26.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let notificationVC = UINavigationController(rootViewController: NotificationViewController())
        let directMessageVC = UINavigationController(rootViewController: DirectMessageViewController())
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        searchVC.tabBarItem.selectedImage = UIImage(systemName: "")
        
        notificationVC.tabBarItem.image = UIImage(systemName: "bell")
        notificationVC.tabBarItem.selectedImage = UIImage(systemName: "bell.fill")
        
        directMessageVC.tabBarItem.image = UIImage(systemName: "envelope")
        directMessageVC.tabBarItem.selectedImage = UIImage(systemName: "envelope.fill")
        
        setViewControllers([homeVC, searchVC, notificationVC, directMessageVC], animated: true)
    }
}

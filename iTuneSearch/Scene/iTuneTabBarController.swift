//
//  iTuneTabBarController.swift
//  iTuneSearch
//
//  Created by 선상혁 on 2023/11/09.
//

import UIKit

final class iTuneTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        
        let firstVC = UINavigationController(rootViewController: iTuneViewController())
        let secondVC = UINavigationController(rootViewController: iTuneSampleViewController())
        
        firstVC.tabBarItem = UITabBarItem(title: "메인", image: UIImage(systemName: "star"), tag: 1)
        secondVC.tabBarItem = UITabBarItem(title: "샘플", image: UIImage(systemName: "heart"), tag: 2)
        
        viewControllers = [firstVC, secondVC]
    }
}

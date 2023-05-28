//
//  MainTabBarController.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/23.
//

import UIKit

final class MainTabBarController: UITabBarController {

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        viewControllers = [
            homeViewController(),
            gameViewController(),
            appViewController(),
            arcadeViewController(),
            searchViewController()
        ]
    }

    private func setupTabBar() {
//        tabBar.backgroundColor = .designSystem(.BackgroundColorSecondary)
//        tabBar.tintColor = .designSystem(.AccentColor)
//        tabBar.unselectedItemTintColor = .designSystem(.TextColorSecondary)
    }
}

extension MainTabBarController {
    private func homeViewController() -> UIViewController {
        let viewController = UINavigationController(rootViewController: HomeViewController())

        viewController.tabBarItem = UITabBarItem(
            title: "투데이",
            image: UIImage(systemName: "newspaper"),
            tag: 0
        )

        return viewController
    }

    private func gameViewController() -> UIViewController {
        let viewController = UINavigationController(rootViewController: GameViewController())

        viewController.tabBarItem = UITabBarItem(
            title: "게임",
            image: UIImage(systemName: "gamecontroller"),
            tag: 1
        )

        return viewController
    }

    private func appViewController() -> UIViewController {
        let viewController = UINavigationController(rootViewController: AppViewController())

        viewController.tabBarItem = UITabBarItem(
            title: "앱",
            image: UIImage(systemName: "square.stack.3d.up.fill"),
            tag: 2
        )

        return viewController
    }

    private func arcadeViewController() -> UIViewController {
        let viewController = UINavigationController(rootViewController: ArcadeViewController())

        viewController.navigationItem.backButtonTitle = ""
        viewController.tabBarItem = UITabBarItem(
            title: "Arcade",
            image: UIImage(systemName: "playstation.logo"),
            tag: 3
        )

        return viewController
    }

    private func searchViewController() -> UIViewController {
        let viewController = UINavigationController(rootViewController: SearchViewController())

        viewController.navigationItem.backButtonTitle = ""
        viewController.tabBarItem = UITabBarItem(
            title: "검색",
            image: UIImage(systemName: "magnifyingglass"),
            tag: 4
        )

        return viewController
    }
}


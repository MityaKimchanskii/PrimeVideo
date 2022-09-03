//
//  AppDelegate.swift
//  PrimeVideo
//
//  Created by Mitya Kim on 9/2/22.
//

import UIKit

// MARK: - Base Class - AmazonPrimeVideoViewController
class AmazonPrimeVideoViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {}
    
    func setTabBarImageFromSFSymbols(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
    
    func setTabBarImageFromAsset(imageName: String, title: String) {
        let image = UIImage(named: imageName)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}

// MARK: - StoreViewController
class StoreViewController: AmazonPrimeVideoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Store"
        view.backgroundColor = .systemCyan
    }
    
    override func commonInit() {
        setTabBarImageFromAsset(imageName: "bag", title: "Store")
    }
}

// MARK: - FindViewController
class FindViewController: AmazonPrimeVideoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Find"
        view.backgroundColor = .systemGreen
    }
    
    override func commonInit() {
        setTabBarImageFromSFSymbols(imageName: "magnifyingglass", title: "Find")
    }
}

// MARK: - DownloadsViewController
class DownloadsViewController: AmazonPrimeVideoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Downloads"
        view.backgroundColor = .systemOrange
    }
    
    override func commonInit() {
        setTabBarImageFromAsset(imageName: "download", title: "Downloads")
    }
}

// MARK: - MyStuffViewController
class MyStuffViewController: AmazonPrimeVideoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Stuff"
        view.backgroundColor = .systemRed
    }
    
    override func commonInit() {
        setTabBarImageFromSFSymbols(imageName: "person.crop.circle.fill", title: "My Stuff")
    }
}


// MARK: - AppDelegate
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let homeVC = HomeViewController()
        let storeVC = StoreViewController()
        let findVC = FindViewController()
        let downloadsVC = DownloadsViewController()
        let myStuffVC = MyStuffViewController()

        let homeNC = UINavigationController(rootViewController: homeVC)
        let storeNC = UINavigationController(rootViewController: storeVC)
        let findNC = UINavigationController(rootViewController: findVC)
        let dowloadsNC = UINavigationController(rootViewController: downloadsVC)
        let myStuffNC = UINavigationController(rootViewController: myStuffVC)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeNC, storeNC, findNC, dowloadsNC, myStuffNC]
        tabBarController.tabBar.tintColor = UIColor(named: "amazonColor")
        tabBarController.tabBar.backgroundColor = .black
        
        window?.rootViewController = tabBarController
//        window?.rootViewController = ReusableView()
        
        return true
    }
}


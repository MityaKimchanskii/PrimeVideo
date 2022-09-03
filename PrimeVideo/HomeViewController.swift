//
//  ViewController.swift
//  PrimeVideo
//
//  Created by Mitya Kim on 9/2/22.
//

import UIKit

class HomeViewController: AmazonPrimeVideoViewController {

    // MARK: - Views
    let headerView = HeaderView()
    
    var homeButton: UIButton!
    var originalsButton: UIButton!
    var tvButton: UIButton!
    var moviesButton: UIButton!
    var kidsButton: UIButton!
    
    let indicator = UIView()
    var indicatorLeading: NSLayoutConstraint?
    var indicatorTrailing: NSLayoutConstraint?
    let buttonSpace: CGFloat = 8.0
    
    let container = Container()
    
    let viewControllers: [UIViewController] = [HomeMenuViewController(), OriginalsMenuViewController(), TVMenuViewController(), MoviesMenuViewController(), KidsMenuViewController()]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        setupAndLayoutViews()
    }
    
    override func commonInit() {
        setTabBarImageFromAsset(imageName: "home", title: "Home")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        homeButton = makeBarButton(text: "Home", selector: #selector(homeTapped))
        originalsButton = makeBarButton(text: "Originals", selector: #selector(originalsTapped))
        tvButton = makeBarButton(text: "TV", selector: #selector(tvTapped))
        moviesButton = makeBarButton(text: "Movies", selector: #selector(moviesTapped))
        kidsButton = makeBarButton(text: "Kids", selector: #selector(kidsTapped))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helper Methods
extension HomeViewController {
    func setupAndLayoutViews() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.backgroundColor = .white
        
        view.addSubview(headerView)
        view.addSubview(homeButton)
        view.addSubview(originalsButton)
        view.addSubview(tvButton)
        view.addSubview(moviesButton)
        view.addSubview(kidsButton)
        view.addSubview(indicator)
        
        guard let containerView = container.view else { return }
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        navigationController?.navigationBar.isHidden = true
        
        let length = UIScreen.main.bounds.width - (homeButton.intrinsicContentSize.width +
                                                   originalsButton.intrinsicContentSize.width +
                                                   tvButton.intrinsicContentSize.width +
                                                   moviesButton.intrinsicContentSize.width +
                                                   kidsButton.intrinsicContentSize.width +
                                                   4*buttonSpace)
        let padding = length / 2
  
        NSLayoutConstraint.activate([
            // headerView
            headerView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 35),
            
            // homeButton
            homeButton.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 1),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            
            // originalButton
            originalsButton.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 1),
            originalsButton.leadingAnchor.constraint(equalToSystemSpacingAfter: homeButton.trailingAnchor, multiplier: 1),
            
            // tvButton
            tvButton.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 1),
            tvButton.leadingAnchor.constraint(equalToSystemSpacingAfter: originalsButton.trailingAnchor, multiplier: 1),
            
            // moviewButton
            moviesButton.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 1),
            moviesButton.leadingAnchor.constraint(equalToSystemSpacingAfter: tvButton.trailingAnchor, multiplier: 1),
            
            // kidsButton
            kidsButton.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 1),
            kidsButton.leadingAnchor.constraint(equalToSystemSpacingAfter: moviesButton.trailingAnchor, multiplier: 1),
            
            // containerView
            containerView.topAnchor.constraint(equalToSystemSpacingBelow: homeButton.bottomAnchor, multiplier: 2),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // indicatorView
            indicator.topAnchor.constraint(equalToSystemSpacingBelow: homeButton.bottomAnchor, multiplier: 1),
            indicator.heightAnchor.constraint(equalToConstant: 3),
        ])
        
        indicatorLeading = indicator.leadingAnchor.constraint(equalTo: homeButton.leadingAnchor)
        indicatorTrailing = indicator.trailingAnchor.constraint(equalTo: homeButton.trailingAnchor)

        indicatorLeading?.isActive = true
        indicatorTrailing?.isActive = true
    }
    
    func makeBarButton(text: String, selector: Selector) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: selector, for: .primaryActionTriggered)
        let attr = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .footnote).withTraits(traits: [.traitBold]),
                    NSAttributedString.Key.foregroundColor: UIColor.label
        ]
        let attrText = NSMutableAttributedString(string: text, attributes: attr)
        button.setAttributedTitle(attrText, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        return button
    }
}

// MARK: - Actions
extension HomeViewController {
    @objc func homeTapped() {
        if container.children.first == viewControllers[0] { return }
        container.add(viewControllers[0])
        viewControllers[1].remove()
        viewControllers[2].remove()
        viewControllers[3].remove()
        viewControllers[4].remove()
        
        UIView.animate(withDuration: 0.5) {
            self.homeButton.alpha = 1.0
            self.originalsButton.alpha = 0.5
            self.tvButton.alpha = 0.5
            self.moviesButton.alpha = 0.5
            self.kidsButton.alpha = 0.5
        }
        
        indicatorLeading?.constant = 0
        indicatorTrailing?.constant = 0
    }
    
    @objc func originalsTapped() {
        if container.children.first == viewControllers[1] { return }
        container.add(viewControllers[1])
        viewControllers[0].remove()
        viewControllers[2].remove()
        viewControllers[3].remove()
        viewControllers[4].remove()
        
        UIView.animate(withDuration: 0.5) {
            self.homeButton.alpha = 0.5
            self.originalsButton.alpha = 1.0
            self.tvButton.alpha = 0.5
            self.moviesButton.alpha = 0.5
            self.kidsButton.alpha = 0.5
        }
        
        indicatorLeading?.constant = homeButton.frame.width + buttonSpace
        indicatorTrailing?.constant = originalsButton.frame.width + buttonSpace
    }
    
    @objc func tvTapped() {
        if container.children.first == viewControllers[2] { return }
        container.add(viewControllers[2])
        viewControllers[1].remove()
        viewControllers[0].remove()
        viewControllers[3].remove()
        viewControllers[4].remove()
        
        UIView.animate(withDuration: 0.5) {
            self.homeButton.alpha = 0.5
            self.originalsButton.alpha = 0.5
            self.tvButton.alpha = 1.0
            self.moviesButton.alpha = 0.5
            self.kidsButton.alpha = 0.5
        }
        
        indicatorLeading?.constant = originalsButton.frame.width + 2*buttonSpace + homeButton.frame.width
        indicatorTrailing?.constant = originalsButton.frame.width + 2*buttonSpace + tvButton.frame.width
    }
    
    @objc func moviesTapped() {
        if container.children.first == viewControllers[3] { return }
        container.add(viewControllers[3])
        viewControllers[1].remove()
        viewControllers[0].remove()
        viewControllers[2].remove()
        viewControllers[4].remove()
        
        UIView.animate(withDuration: 0.5) {
            self.homeButton.alpha = 0.5
            self.originalsButton.alpha = 0.5
            self.tvButton.alpha = 0.5
            self.moviesButton.alpha = 1.0
            self.kidsButton.alpha = 0.5
        }
        
        indicatorLeading?.constant = originalsButton.frame.width + 3*buttonSpace + homeButton.frame.width + tvButton.frame.width
        indicatorTrailing?.constant = originalsButton.frame.width + 3*buttonSpace + tvButton.frame.width + moviesButton.frame.width
    }
    
    @objc func kidsTapped() {
        if container.children.first == viewControllers[4] { return }
        container.add(viewControllers[4])
        viewControllers[1].remove()
        viewControllers[0].remove()
        viewControllers[3].remove()
        viewControllers[2].remove()
        
        UIView.animate(withDuration: 0.5) {
            self.homeButton.alpha = 0.5
            self.originalsButton.alpha = 0.5
            self.tvButton.alpha = 0.5
            self.moviesButton.alpha = 0.5
            self.kidsButton.alpha = 1.0
        }
        
        indicatorLeading?.constant = originalsButton.frame.width + 4*buttonSpace + homeButton.frame.width + tvButton.frame.width + moviesButton.frame.width
        indicatorTrailing?.constant = originalsButton.frame.width + 4*buttonSpace + tvButton.frame.width + moviesButton.frame.width + kidsButton.frame.width
    }
}


class HomeMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
}

class OriginalsMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
    }
}

class TVMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}

class MoviesMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
    }
}

class KidsMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}

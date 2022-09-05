//
//  HomeMenuViewController.swift
//  PrimeVideo
//
//  Created by Mitya Kim on 9/3/22.
//

import Foundation
import UIKit

class HomeMenuViewController: UIViewController {
    
    // tableView
    let tableView = UITableView()
    let tableViewCellId = "tableViewCellId"
    let headerCellId = "headerCellId"
    
    let button = UIButton()
    let height: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        style()
        layout()
    }
}

// MARK: - Helper Methods
extension HomeMenuViewController {
    func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: tableViewCellId)
        tableView.register(SectionHeaderView.self, forHeaderFooterViewReuseIdentifier: headerCellId)
        tableView.backgroundColor = UIColor(named: "bacgroundColor")
        tableView.separatorColor = UIColor(named: "bacgroundColor")
        
        button.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "dot.radiowaves.up.forward", withConfiguration: configuration)
        button.setImage(image, for: .normal)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.tintColor = .white
        button.layer.cornerRadius = height/2
    }
    
    func layout() {
        view.addSubview(tableView)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -220),

            view.trailingAnchor.constraint(equalToSystemSpacingAfter: button.trailingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: button.bottomAnchor, multiplier: 29),
            button.heightAnchor.constraint(equalToConstant: height),
            button.widthAnchor.constraint(equalToConstant: height)
        ])
    }
}

// MARK: - UITableView
extension HomeMenuViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
    
        let rowArray = objectArray[indexPath.section]
        cell.updateCellWith(row: rowArray)
        return cell
    }
}

extension HomeMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 0
        if indexPath.section == 0 {
            height = 170
        } else {
            height = 110
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerCellId) as? SectionHeaderView
        if section == 1 {
            header?.configure(title: "Movies we think you'll like", subtitle: "Included with Prime")
        } else if section == 2 {
            header?.configure(title: "Amazon Originals", subtitle: "Included with Prime")
        } else if section == 3 {
            header?.configure(title: "Action and adventure movies", subtitle: "Included with Prime")
        } else if section == 4 {
            header?.configure(title: "Drama movies", subtitle: "Included with Prime")
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height: CGFloat = 0
        if section == 0 {
            height = 0
        } else {
            height = 40
        }
        return height
    }
}

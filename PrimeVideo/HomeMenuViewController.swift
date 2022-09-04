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
    
    // collectionView
    let movieCellId = "movieCellId"
    
    let colors: [UIColor] = [.systemRed, .systemCyan, .blue, .green, .orange]

    
    lazy var topCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieTopCollectionViewCell.self, forCellWithReuseIdentifier: movieCellId)
        cv.backgroundColor = UIColor(named: "backgroundColor")
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
   
    lazy var likeMovieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: movieCellId)
        cv.backgroundColor = UIColor(named: "backgroundColor")
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    
    lazy var originalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: movieCellId)
        cv.backgroundColor = UIColor(named: "backgroundColor")
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    lazy var actionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: movieCellId)
        cv.backgroundColor = UIColor(named: "backgroundColor")
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    lazy var dramaCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: movieCellId)
        cv.backgroundColor = UIColor(named: "backgroundColor")
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
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
        
    }
    
    func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -220)
        ])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topCollectionView {
            return CGSize(width: view.frame.width, height: collectionView.frame.height)
        } else {
            return CGSize(width: 130, height: collectionView.frame.height)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeMenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = 0
        if collectionView == topCollectionView {
            count = headerList.count
        } else if collectionView == likeMovieCollectionView {
            count = movieList1.count
        } else if collectionView == originalCollectionView {
            count = movieList2.count
        } else if collectionView == actionCollectionView {
            count = movieList3.count
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath)
        
        if collectionView == topCollectionView {
            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieTopCollectionViewCell
            cellToReturn.movie = headerList[indexPath.item]
            cell = cellToReturn
        } else if collectionView == likeMovieCollectionView {
            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieCollectionViewCell
            cellToReturn.movie = movieList1[indexPath.item]
            cell = cellToReturn
        } else if collectionView == originalCollectionView {
            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieCollectionViewCell
            cellToReturn.movie = movieList2[indexPath.item]
            cell = cellToReturn
        } else if collectionView == actionCollectionView {
            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieCollectionViewCell
            cellToReturn.movie = movieList3[indexPath.item]
            cell = cellToReturn
        }
        return cell
    }
}

// MARK: - UITableView
extension HomeMenuViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        var index = indexPath.row
        
        switch indexPath.section {
        case 0:
            index = 0
        case 1:
            index = 1
        case 2:
            index = 2
        case 3:
            index = 3
        case 4:
            index = 4
        default:
            break
        }
        
        cell.backgroundColor = colors[index]
        return cell
    }
}

extension HomeMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 0
        if indexPath.section == 0 {
            height = 170
        } else {
            height = 120
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

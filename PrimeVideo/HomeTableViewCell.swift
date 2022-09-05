//
//  HomeTableViewCell.swift
//  PrimeVideo
//
//  Created by Mitya Kim on 9/4/22.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    let identifier = "collectionCellId"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieTopCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = UIColor(named: "backgroundColor")
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    var rowWithMovies: [CollectionViewCellModel]?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//    }
}

extension HomeTableViewCell {
    private func setup() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension HomeTableViewCell {
    func configure(with row: [CollectionViewCellModel]) {
        self.rowWithMovies = row
        self.collectionView.reloadData()
    }
}

extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // The data we passed from the TableView send them to the CollectionView Model
    func updateCellWith(row: [CollectionViewCellModel]) {
        self.rowWithMovies = row
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rowWithMovies?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        cell.movieImageView.image = UIImage(named: self.rowWithMovies?[indexPath.item].movieName ?? "placeholder")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: collectionView.frame.height)
    }
    
    // Add spaces at the beginning and the end of the collection view
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
//    }
}

//// MARK: - UICollectionViewDelegateFlowLayout
//extension HomeMenuViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == topCollectionView {
//            return CGSize(width: view.frame.width, height: collectionView.frame.height)
//        } else {
//            return CGSize(width: 130, height: collectionView.frame.height)
//        }
//    }
//}
//
//// MARK: - UICollectionViewDataSource
//extension HomeMenuViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        var count = 0
//        if collectionView == topCollectionView {
//            count = headerList.count
//        } else if collectionView == likeMovieCollectionView {
//            count = movieList1.count
//        } else if collectionView == originalCollectionView {
//            count = movieList2.count
//        } else if collectionView == actionCollectionView {
//            count = movieList3.count
//        }
//        return count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath)
//
//        if collectionView == topCollectionView {
//            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieTopCollectionViewCell
//            cellToReturn.movie = headerList[indexPath.item]
//            cell = cellToReturn
//        } else if collectionView == likeMovieCollectionView {
//            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieCollectionViewCell
//            cellToReturn.movie = movieList1[indexPath.item]
//            cell = cellToReturn
//        } else if collectionView == originalCollectionView {
//            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieCollectionViewCell
//            cellToReturn.movie = movieList2[indexPath.item]
//            cell = cellToReturn
//        } else if collectionView == actionCollectionView {
//            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieCollectionViewCell
//            cellToReturn.movie = movieList3[indexPath.item]
//            cell = cellToReturn
//        }
//        return cell
//    }
//}

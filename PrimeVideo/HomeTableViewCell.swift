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
    let headerId = "header"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        cv.backgroundColor = UIColor(named: "backgroundColor")
        cv.showsHorizontalScrollIndicator = false
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
}

extension HomeTableViewCell {
    func updateCellWith(row: [CollectionViewCellModel]) {
        self.rowWithMovies = row
        self.collectionView.reloadData()
    }
    
    private func setup() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor(named: "bacgroundColor")
    }
    
    private func layout() {
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

extension HomeTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rowWithMovies?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.register(MovieTopCollectionViewCell.self, forCellWithReuseIdentifier: headerId)
        
        switch rowWithMovies! == headerList {
        case true:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as? MovieTopCollectionViewCell else { return UICollectionViewCell() }
            cell.movieImageView.image = UIImage(named: self.rowWithMovies?[indexPath.item].movieName ?? "placeholder")
            return cell
        case false:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
            cell.movieImageView.image = UIImage(named: self.rowWithMovies?[indexPath.item].movieName ?? "placeholder")
            return cell
        }
    }
    
    
}
// MARK: - UICollectionViewDelegateFlowLayout
extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if rowWithMovies! == headerList {
            return CGSize(width: contentView.frame.width, height: collectionView.frame.height)
        }
        return CGSize(width: 170, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch rowWithMovies! == headerList {
        case true:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case false:
            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        }
    }
}

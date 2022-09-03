//
//  HomeMenuViewController.swift
//  PrimeVideo
//
//  Created by Mitya Kim on 9/3/22.
//

import Foundation
import UIKit

class HomeMenuViewController: UIViewController {
    
    let collectionReusableView = UICollectionReusableView()
    let movieCellId = "movieCellId"
    
    lazy var topCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieTopCell.self, forCellWithReuseIdentifier: movieCellId)
        cv.backgroundColor = UIColor(named: "backgroundColor")
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let likeTitleLabel = UILabel()
    let likeSubtitleLabel = UILabel()
    
    lazy var likeMovieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieCell.self, forCellWithReuseIdentifier: movieCellId)
        cv.backgroundColor = UIColor(named: "backgroundColor")
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let originalTitleLabel = UILabel()
    let originalSubtitleLabel = UILabel()
    
    lazy var originalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieCell.self, forCellWithReuseIdentifier: movieCellId)
        cv.backgroundColor = UIColor(named: "backgroundColor")
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let actionTitleLabel = UILabel()
    let actionSubtitleLabel = UILabel()
    
    lazy var actionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MovieCell.self, forCellWithReuseIdentifier: movieCellId)
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
        collectionReusableView.translatesAutoresizingMaskIntoConstraints = false
        
        likeSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        likeSubtitleLabel.text = "Included with Prime"
        likeSubtitleLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        likeSubtitleLabel.textColor = UIColor(named: "amazonColor")
        
        likeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        likeTitleLabel.text = "Movies we think you'll like"
        likeTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        likeTitleLabel.tintColor = .white
        
        originalSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        originalSubtitleLabel.text = "Included with Prime"
        originalSubtitleLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        originalSubtitleLabel.textColor = UIColor(named: "amazonColor")
        
        originalTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        originalTitleLabel.text = "Amazon Originals"
        originalTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        originalTitleLabel.tintColor = .white
        
        actionSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        actionSubtitleLabel.text = "Included with Prime"
        actionSubtitleLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        actionSubtitleLabel.textColor = UIColor(named: "amazonColor")
        
        actionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        actionTitleLabel.text = "Action and adventure movies"
        actionTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        actionTitleLabel.tintColor = .white
    }
    
    func layout() {
        view.addSubview(collectionReusableView)
        collectionReusableView.addSubview(topCollectionView)
        collectionReusableView.addSubview(likeMovieCollectionView)
        collectionReusableView.addSubview(originalCollectionView)
        collectionReusableView.addSubview(actionCollectionView)
        view.addSubview(topCollectionView)
        view.addSubview(likeMovieCollectionView)
        view.addSubview(originalCollectionView)
        view.addSubview(actionCollectionView)
        
        collectionReusableView.addSubview(likeSubtitleLabel)
        collectionReusableView.addSubview(likeTitleLabel)
        
        collectionReusableView.addSubview(originalSubtitleLabel)
        collectionReusableView.addSubview(originalTitleLabel)
        
        collectionReusableView.addSubview(actionSubtitleLabel)
        collectionReusableView.addSubview(actionTitleLabel)
        
        let stackView = UIStackView()
        stackView.backgroundColor = .systemRed
        collectionReusableView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            collectionReusableView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionReusableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionReusableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionReusableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            topCollectionView.topAnchor.constraint(equalTo: collectionReusableView.topAnchor),
            topCollectionView.leadingAnchor.constraint(equalTo: collectionReusableView.leadingAnchor),
            topCollectionView.trailingAnchor.constraint(equalTo: collectionReusableView.trailingAnchor),
            topCollectionView.heightAnchor.constraint(equalToConstant: 170),
            
            likeSubtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topCollectionView.bottomAnchor, multiplier: 2),
            likeSubtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: collectionReusableView.leadingAnchor, multiplier: 3),
            
            likeTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: likeSubtitleLabel.bottomAnchor, multiplier: 0),
            likeTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: collectionReusableView.leadingAnchor, multiplier: 3),
            
            likeMovieCollectionView.topAnchor.constraint(equalToSystemSpacingBelow: likeTitleLabel.bottomAnchor, multiplier: 0),
            likeMovieCollectionView.leadingAnchor.constraint(equalToSystemSpacingAfter: collectionReusableView.leadingAnchor, multiplier: 3),
            collectionReusableView.trailingAnchor.constraint(equalToSystemSpacingAfter: likeMovieCollectionView.trailingAnchor, multiplier: 0),
            likeMovieCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            originalSubtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: likeMovieCollectionView.bottomAnchor, multiplier: 2),
            originalSubtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: collectionReusableView.leadingAnchor, multiplier: 3),
            
            originalTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: originalSubtitleLabel.bottomAnchor, multiplier: 0),
            originalTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: collectionReusableView.leadingAnchor, multiplier: 3),
            
            originalCollectionView.topAnchor.constraint(equalToSystemSpacingBelow: originalTitleLabel.bottomAnchor, multiplier: 0),
            originalCollectionView.leadingAnchor.constraint(equalToSystemSpacingAfter: collectionReusableView.leadingAnchor, multiplier: 3),
            collectionReusableView.trailingAnchor.constraint(equalToSystemSpacingAfter: originalCollectionView.trailingAnchor, multiplier: 0),
            originalCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            actionSubtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: originalCollectionView.bottomAnchor, multiplier: 2),
            actionSubtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: collectionReusableView.leadingAnchor, multiplier: 3),
            
            actionTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: actionSubtitleLabel.bottomAnchor, multiplier: 0),
            actionTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: collectionReusableView.leadingAnchor, multiplier: 3),
            
            actionCollectionView.topAnchor.constraint(equalToSystemSpacingBelow: actionTitleLabel.bottomAnchor, multiplier: 0),
            actionCollectionView.leadingAnchor.constraint(equalToSystemSpacingAfter: collectionReusableView.leadingAnchor, multiplier: 3),
            collectionReusableView.trailingAnchor.constraint(equalToSystemSpacingAfter: actionCollectionView.trailingAnchor, multiplier: 0),
            actionCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
//            stackView.topAnchor.constraint(equalToSystemSpacingBelow: actionCollectionView.bottomAnchor, multiplier: 3),
//            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            stackView.heightAnchor.constraint(equalToConstant: 20)
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
            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieTopCell
            cellToReturn.movie = headerList[indexPath.item]
            cell = cellToReturn
        } else if collectionView == likeMovieCollectionView {
            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieCell
            cellToReturn.movie = movieList1[indexPath.item]
            cell = cellToReturn
        } else if collectionView == originalCollectionView {
            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieCell
            cellToReturn.movie = movieList2[indexPath.item]
            cell = cellToReturn
        } else if collectionView == actionCollectionView {
            let cellToReturn = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as! MovieCell
            cellToReturn.movie = movieList3[indexPath.item]
            cell = cellToReturn
        }
        return cell
    }
}


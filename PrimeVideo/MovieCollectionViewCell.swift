//
//  MovieCell.swift
//  PrimeVideo
//
//  Created by Mitya Kim on 9/3/22.
//

import Foundation
import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    var movieImageView = UIImageView()

    var movie: CollectionViewCellModel? {
        didSet {
            guard let movie = movie else { return }
            let image = UIImage(named: movie.movieName) ?? UIImage(named: "placeholder")!
            
            movieImageView.image = image
        }
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
        backgroundColor = UIColor(named: "backgroundColor")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.contentMode = .scaleAspectFill
        addSubview(movieImageView)
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

//
//  MovieCell.swift
//  PrimeVideo
//
//  Created by Mitya Kim on 9/3/22.
//

import Foundation
import UIKit

class MovieTopCollectionViewCell: UICollectionViewCell {
    
    var movieImageView = UIImageView()
   
    var movie: CollectionViewCellModel? {
        didSet {
            guard let track = movie else { return }
            let image = UIImage(named: track.movieName) ?? UIImage(named: "placeholder")!
            
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
        contentView.addSubview(movieImageView)
        
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

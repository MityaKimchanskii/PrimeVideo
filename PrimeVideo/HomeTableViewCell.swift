//
//  HomeTableViewCell.swift
//  PrimeVideo
//
//  Created by Mitya Kim on 9/4/22.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    
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
    private func setup() {
       
    }
    
    private func layout() {
       
        
        NSLayoutConstraint.activate([
           
        ])
    }
}

extension HomeTableViewCell {
    func configure(with vm: UICollectionView) {
        
    }
}

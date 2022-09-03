//
//  HeaderView.swift
//  PrimeVideo
//
//  Created by Mitya Kim on 9/2/22.
//

import UIKit

class HeaderView: UIView {
    
    let imageView = UIImageView()
    let label = UILabel()
    let switchFreeToMe = UISwitch()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "logo")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .white
        label.text = "Free to me"
        
        switchFreeToMe.translatesAutoresizingMaskIntoConstraints = false
        switchFreeToMe.onTintColor = UIColor(named: "amazonColor")
    }
    
    private func layout() {
        addSubview(imageView)
        addSubview(label)
        addSubview(switchFreeToMe)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            switchFreeToMe.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: switchFreeToMe.trailingAnchor, multiplier: 4),
            
            label.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            switchFreeToMe.leadingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 2),
        ])
    }
}

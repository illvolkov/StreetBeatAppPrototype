//
//  AdCollectionViewCell.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

import UIKit

class AdCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier

    static let identifier = "AdCollectionViewCell"
    
    //MARK: - Views
    
    private lazy var adImage = UIImageView()
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        contentView.addSubview(adImage)
    }
    
    private func setupLayout() {
        adImage.translatesAutoresizingMaskIntoConstraints = false
        adImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        adImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        adImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        adImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func configure(with model: Product) {
        adImage.image = UIImage(named: model.image ?? "")
        setupHierarchy()
        setupLayout()
    }
}

//
//  PictureCollectionViewCell.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier

    static let identifier = "PictureCollectionViewCell"
    
    //MARK: - Views

    
    private lazy var pictureImage = UIImageView()
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        contentView.addSubview(pictureImage)
    }
    
    private func setupLayout() {
        pictureImage.translatesAutoresizingMaskIntoConstraints = false
        pictureImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        pictureImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        pictureImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        pictureImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func configure(with model: Product) {
        pictureImage.image = UIImage(named: model.image ?? "")
        setupHierarchy()
        setupLayout()
    }
}

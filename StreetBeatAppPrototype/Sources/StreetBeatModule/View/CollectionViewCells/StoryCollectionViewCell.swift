//
//  StoryCollectionViewCell.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "StoryCollectionViewCell"
    
    //MARK: - Views
    
    private lazy var storyImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = contentView.frame.width * 0.2
        return image
    }()
    
    //MARK: - Settings

    private func setupHierarchy() {
        contentView.addSubview(storyImage)
    }
    
    private func setupLayout() {
        storyImage.translatesAutoresizingMaskIntoConstraints = false
        storyImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        storyImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        storyImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        storyImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func configure(with model: Product) {
        storyImage.image = UIImage(named: model.image ?? "")
        setupHierarchy()
        setupLayout()
    }
}

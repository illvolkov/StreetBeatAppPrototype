//
//  InfoCollectionViewCell.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier

    static let identifier = "InfoCollectionViewCell"
    
    //MARK: - Views
    
    private lazy var infoImage = UIImageView()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: contentView.frame.width * 0.05)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: contentView.frame.width * 0.042)
        label.alpha = 0.5
        return label
    }()
    
    private lazy var chevronImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.forward")
        image.tintColor = .lightGray
        return image
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        contentView.addSubview(infoImage)
        contentView.addSubview(infoLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(chevronImage)
        contentView.addSubview(dividerView)
    }
    
    private func setupLayout() {
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        infoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        infoImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        infoImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.06).isActive = true
        infoImage.heightAnchor.constraint(equalTo: infoImage.widthAnchor).isActive = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        infoLabel.leftAnchor.constraint(equalTo: infoImage.rightAnchor, constant: 15).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: infoImage.rightAnchor, constant: 15).isActive = true
        
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        chevronImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
        chevronImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        chevronImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.04).isActive = true
        chevronImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.06).isActive = true
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.leftAnchor.constraint(equalTo: infoImage.rightAnchor, constant: 15).isActive = true
        dividerView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        dividerView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.001).isActive = true
    }
    
    func configure(with model: Product) {
        infoImage.image = UIImage(named: model.image ?? "")
        infoLabel.text = model.description
        descriptionLabel.text = model.description
        descriptionLabel.text = model.header
        setupHierarchy()
        setupLayout()
    }
}

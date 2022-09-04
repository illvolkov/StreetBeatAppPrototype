//
//  CatalogTableViewCell.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 03.09.2022.
//

import UIKit

class CatalogTableViewCell: UITableViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "CatalogTableViewCell"
    
    //MARK: - View
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: contentView.frame.width * 0.055)
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    //MARK: - Settings
    
    private func setupLayout(with model: Catalog) {
        contentView.addSubview(label)
        contentView.addSubview(image)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 7).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: contentView.frame.width * 0.2).isActive = true
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 7).isActive = true
        
        if model.title == "Бренды" {
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
            image.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1).isActive = true
        } else {
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.35).isActive = true
            image.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.85).isActive = true
        }
    }
    
    private func setupContentView() {
        contentView.backgroundColor = .white
        contentView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
    }
    
    func configure(with model: Catalog) {
        label.text = model.title
        image.image = UIImage(named: model.image)
        setupLayout(with: model)
        setupContentView()
    }
}

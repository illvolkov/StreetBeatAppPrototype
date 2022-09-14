//
//  ProductCollectionViewCell.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier

    static let identifier = "ProductCollectionViewCell"
    
    //MARK: - Views
    
    private lazy var productImage = UIImageView()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: contentView.frame.width * 0.035)
        return label
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNextCondensed-Heavy", size: contentView.frame.width * 0.06)
        return label
    }()
    
    private lazy var lookLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: contentView.frame.width * 0.035)
        return label
    }()
    
    private lazy var chevronImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.forward")
        image.tintColor = .black
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.layer.cornerRadius = contentView.frame.width * 0.03
        stack.alignment = .center
        stack.distribution = .init(rawValue: 2) ?? UIStackView.Distribution.fill
        return stack
    }()
    
    private lazy var lookView = UIView()
    
    //MARK: - Settings
    
    private func setupLayout(with model: Product) {
        contentView.addSubview(productImage)
        contentView.addSubview(chevronImage)
        contentView.addSubview(stackView)
        
        if model.description != nil {
            stackView.addArrangedSubview(descriptionLabel)
        }
        
        if model.header != nil {
            stackView.addArrangedSubview(headerLabel)
        }
        
        if model.lookLabel != nil {
            lookView.addSubview(lookLabel)
            lookView.addSubview(chevronImage)
            stackView.addArrangedSubview(lookView)
            
            lookView.translatesAutoresizingMaskIntoConstraints = false
            lookView.heightAnchor.constraint(equalTo: lookLabel.heightAnchor).isActive = true
            
            lookLabel.translatesAutoresizingMaskIntoConstraints = false
            lookLabel.centerYAnchor.constraint(equalTo: lookView.centerYAnchor).isActive = true
            lookLabel.centerXAnchor.constraint(equalTo: lookView.centerXAnchor).isActive = true
            
            chevronImage.translatesAutoresizingMaskIntoConstraints = false
            chevronImage.leftAnchor.constraint(equalTo: lookLabel.rightAnchor, constant: 5).isActive = true
            chevronImage.centerYAnchor.constraint(equalTo: lookLabel.centerYAnchor).isActive = true
            chevronImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.03).isActive = true
            chevronImage.heightAnchor.constraint(equalTo: chevronImage.widthAnchor).isActive = true
        }
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        productImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        productImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: -15).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.22).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        descriptionLabel.removeFromSuperview()
        headerLabel.removeFromSuperview()
        lookView.removeFromSuperview()
    }
    
    func configure(with model: Product) {
        productImage.image = UIImage(named: model.image ?? "")
        descriptionLabel.text = model.description
        headerLabel.text = model.header
        lookLabel.text = model.lookLabel
        setupLayout(with: model)
    }
}

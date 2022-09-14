//
//  ButtonCollectionViewCell.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier

    static let identifier = "ButtonCollectionViewCell"
    
    //MARK: - Views
    
    private lazy var buttonForCell: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .systemFont(ofSize: contentView.frame.width * 0.05, weight: .semibold)
        button.layer.cornerRadius = contentView.frame.width * 0.02
        button.layer.masksToBounds = true
        return button
    }()
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        contentView.addSubview(buttonForCell)
    }
    
    private func setupLayout() {
        buttonForCell.translatesAutoresizingMaskIntoConstraints = false
        buttonForCell.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        buttonForCell.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        buttonForCell.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        buttonForCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func configure(with model: Product) {
        buttonForCell.setTitle(model.header, for: .normal)
        setupHierarchy()
        setupLayout()
    }
}

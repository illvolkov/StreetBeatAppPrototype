//
//  FavoritesController.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

import UIKit

class FavoritesController: UIViewController {
    
    //MARK: - Global properties
    
    var favoritesViewModel: FavoritesViewModel?
    var coordinator: FavoritesCoordinator?
    
    //MARK: - Views
        
    private lazy var heartImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "heartImage")
        return image
    }()
    
    private lazy var favoritesIsEmptyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: view.frame.width * 0.04, weight: .bold)
        label.text = "В избранном пока пусто"
        return label
    }()
    
    private lazy var addToFavoritesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: view.frame.width * 0.042)
        label.numberOfLines = 0
        label.alpha = 0.6
        label.textAlignment = .center
        label.text = "Понравилась какая-то вещь? Добавь ее в избранное и вернись к ней в любой момент позже"
        return label
    }()
    
    private lazy var goToDirectoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Перейти в каталог", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: view.frame.width * 0.042, weight: .bold)
        button.backgroundColor = .black
        button.layer.cornerRadius = view.frame.width * 0.01
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(heartImage)
        view.addSubview(favoritesIsEmptyLabel)
        view.addSubview(addToFavoritesLabel)
        view.addSubview(goToDirectoryButton)
    }
    
    private func setupLayout() {
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        heartImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        heartImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heartImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        heartImage.heightAnchor.constraint(equalTo: heartImage.widthAnchor).isActive = true
        
        favoritesIsEmptyLabel.translatesAutoresizingMaskIntoConstraints = false
        favoritesIsEmptyLabel.topAnchor.constraint(equalTo: heartImage.bottomAnchor, constant: 20).isActive = true
        favoritesIsEmptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        addToFavoritesLabel.translatesAutoresizingMaskIntoConstraints = false
        addToFavoritesLabel.topAnchor.constraint(equalTo: favoritesIsEmptyLabel.bottomAnchor, constant: 7).isActive = true
        addToFavoritesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addToFavoritesLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
         
        goToDirectoryButton.translatesAutoresizingMaskIntoConstraints = false
        goToDirectoryButton.topAnchor.constraint(equalTo: addToFavoritesLabel.bottomAnchor, constant: 15).isActive = true
        goToDirectoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goToDirectoryButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.46).isActive = true
        goToDirectoryButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.092).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(rgb: 0xF7F7F8)
        title = "Избранное"
    }
    
}

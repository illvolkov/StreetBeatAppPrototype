//
//  BasketController.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 05.09.2022.
//

import UIKit

class BasketController: UIViewController {
    
    //MARK: - Global properties
    
    var basketViewModel: BasketViewModel?
    var coordinator: BasketCoordinator?
    
    //MARK: - Views
    
    private lazy var basketImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "basket.streetBeat")
        return image
    }()
    
    private lazy var favoritesIsEmptyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: view.frame.width * 0.04, weight: .bold)
        label.text = "В корзине пусто"
        return label
    }()
    
    private lazy var addToFavoritesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: view.frame.width * 0.042)
        label.numberOfLines = 0
        label.alpha = 0.6
        label.textAlignment = .center
        label.text = "Попробуйте найти интересующий вас товар через поиск, каталог или загляните в избранное"
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
        view.addSubview(basketImage)
        view.addSubview(favoritesIsEmptyLabel)
        view.addSubview(addToFavoritesLabel)
        view.addSubview(goToDirectoryButton)
    }
    
    private func setupLayout() {
        basketImage.translatesAutoresizingMaskIntoConstraints = false
        basketImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        basketImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        basketImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        basketImage.heightAnchor.constraint(equalTo: basketImage.widthAnchor).isActive = true
        
        favoritesIsEmptyLabel.translatesAutoresizingMaskIntoConstraints = false
        favoritesIsEmptyLabel.topAnchor.constraint(equalTo: basketImage.bottomAnchor, constant: 20).isActive = true
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
        title = "Корзина"
    }
}

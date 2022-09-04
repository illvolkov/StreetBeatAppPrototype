//
//  StreetBeatController.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

import UIKit

class StreetBeatController: UIViewController {
    
    //MARK: - Global properties
    
    var streetBeatViewModel: StreetBeatViewModel?
    var coordinator: StreetBeatCoordinator?
    
    //MARK: - Private properties
    
    private var products = [ProductSection]()
    
    //MARK: - Views
    
    private lazy var searchBar = SearchBar()
    
    private lazy var segmentedControl: SegmentedControl = {
        let segmentedControl = SegmentedControl(frame: .zero, buttonTitle: ["Мужчинам", "Женщинам", "Детям"])
        segmentedControl.backgroundColor = .clear
        return segmentedControl
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.register(AdCollectionViewCell.self, forCellWithReuseIdentifier: AdCollectionViewCell.identifier)
        collectionView.register(PictureCollectionViewCell.self, forCellWithReuseIdentifier: PictureCollectionViewCell.identifier)
        collectionView.register(ButtonCollectionViewCell.self, forCellWithReuseIdentifier: ButtonCollectionViewCell.identifier)
        collectionView.register(InfoCollectionViewCell.self, forCellWithReuseIdentifier: InfoCollectionViewCell.identifier)
        
        collectionView.backgroundColor = UIColor(rgb: 0xF7F7F8)

        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "STREET BEAT"
        label.font = UIFont(name: "AvenirNextCondensed-Heavy", size: view.frame.width * 0.07)
        return label
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupHierarchy()
        setupLayout()
        setupView()
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        streetBeatViewModel?.fetchData()
        streetBeatViewModel?.model.bind({ model in
            if let model = model {
                self.products = model
            }
        })
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(segmentedControl)
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        searchBar.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15).isActive = true
        segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(rgb: 0xF7F7F8)
        navigationItem.titleView = titleView
    }
    
    //MARK: - Sections configure
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            let sectionType = self.products[sectionIndex].type
            switch sectionType {
            case .story:
                return self.configureStorySection()
            case .product:
                return self.configureProductSection()
            case .ad:
                return self.configureAdSection()
            case .picture:
                return self.configurePictureSection()
            case .button:
                return self.configureButtonSection()
            case .info:
                return self.configureInfoSection()
            }
        }
        return layout
    }
    
    private func configureStorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15)
        return section
    }
    
    private func configureProductSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(500))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }

    private func configureAdSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        return section
    }

    private func configurePictureSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(400))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        return section
    }

    private func configureButtonSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(70))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)
        return section
    }

    private func configureInfoSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(85))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)
        return section
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource methods

extension StreetBeatController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products[section].product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productsType = products[indexPath.section].type
        let product = products[indexPath.section].product[indexPath.row]
        
        switch productsType {
        case .story:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: StoryCollectionViewCell.identifier,
                for: indexPath) as? StoryCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: product)
            return cell
        case .product:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductCollectionViewCell.identifier,
                for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: product)
            return cell
        case .ad:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AdCollectionViewCell.identifier,
                for: indexPath) as? AdCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: product)
            return cell
        case .picture:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PictureCollectionViewCell.identifier,
                for: indexPath) as? PictureCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: product)
            return cell
        case .button:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ButtonCollectionViewCell.identifier,
                for: indexPath) as? ButtonCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: product)
            return cell
        case .info:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: InfoCollectionViewCell.identifier,
                for: indexPath) as? InfoCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: product)
            return cell
        }
    }
}

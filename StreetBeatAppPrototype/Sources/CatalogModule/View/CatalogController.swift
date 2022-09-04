//
//  ViewController.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 02.09.2022.
//

import UIKit

class CatalogController: UIViewController {
    
    //MARK: - Global properties
    
    var catalogViewModel: CatalogViewModel?
    var coordinator: CatalogCoordinator?
    
    private var catalogs = [Catalog]()
    
    //MARK: - Views
        
    private lazy var searchBar: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(rgb: 0xEBEEF1)
        textField.placeholder = "Что ты ищешь?"
        textField.layer.cornerRadius = view.frame.width * 0.01
        textField.layer.masksToBounds = true
        
        let glassImage = UIImageView(frame: CGRect(x: 8, y: 2, width: 15, height: 15))
        glassImage.tintColor = .lightGray

        let qrCodeButton = UIButton(frame: CGRect(x: 0, y: -2, width: 23, height: 23))
        
        let glassView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 18))
        let qrCodeView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 18))
        
        let glassIcon = UIImage(systemName: "magnifyingglass")
        let qrCodeIcon = UIImage(systemName: "qrcode.viewfinder")
        
        glassImage.image = glassIcon
        qrCodeButton.setImage(qrCodeIcon, for: .normal)
        qrCodeButton.tintColor = .black

        glassView.addSubview(glassImage)
        qrCodeView.addSubview(qrCodeButton)
        
        textField.leftViewMode = UITextField.ViewMode.always
        textField.rightViewMode = UITextField.ViewMode.always
        textField.leftView = glassView
        textField.rightView = qrCodeView
        return textField
    }()
    
    private lazy var segmentedControll: SegmentedControl = {
        let segmentedControl = SegmentedControl(frame: .zero, buttonTitle: ["Мужчины", "Женщины", "Дети"])
        return segmentedControl
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CatalogTableViewCell.self, forCellReuseIdentifier: CatalogTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(rgb: 0xF7F7F8)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHiearchy()
        setupLayout()
        setupView()
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        catalogViewModel?.fetchData()
        catalogViewModel?.model.bind { model in
            if let model = model {
                self.catalogs = model
            }
        }
    }
    
    //MARK: - Settings
    
    private func setupHiearchy() {
        view.addSubview(searchBar)
        view.addSubview(segmentedControll)
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        searchBar.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        
        segmentedControll.translatesAutoresizingMaskIntoConstraints = false
        segmentedControll.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15).isActive = true
        segmentedControll.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        segmentedControll.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: segmentedControll.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(rgb: 0xF7F7F8)
        title = "Каталог"
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate methods

extension CatalogController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catalogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CatalogTableViewCell.identifier,
            for: indexPath) as? CatalogTableViewCell
        else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configure(with: catalogs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x,
                                 y: cell.bounds.origin.y,
                                 width: cell.bounds.width,
                                 height: cell.bounds.height).inset(by: UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15))
        cell.layer.mask = maskLayer
    }
    
}

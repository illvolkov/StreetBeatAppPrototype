//
//  MyInfoController.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 05.09.2022.
//

import UIKit

class MyInfoController: UIViewController {
    
    //MARK: - Global properties
    
    var myInfoViewModel: MyInfoViewModel?
    var coordinator: MyInfoCoordinator?
                
    //MARK: - Views
    
    private lazy var shopsView = createInfoView()
    private lazy var shopsImage = createInfoImage(with: "shops")
    private lazy var shopsHeader = createHeaderLabel(with: "Магазины Street Beat")
    private lazy var shopsDescrtiption = createDescriptionLabel(with: "Узнайте где ближайшие магазины")
    private lazy var shopsChevronImage = createChevronImage()
    
    private lazy var transferView = createInfoView()
    private lazy var transferImage = createInfoImage(with: "transfer")
    private lazy var transferHeader = createHeaderLabel(with: "Доставка и оплата")
    private lazy var transferDescritption = createDescriptionLabel(with: "Узнайте все способы оплаты и доставки")
    private lazy var transferChevronImage = createChevronImage()
    
    private lazy var feedbackView = createInfoView()
    private lazy var feedbackImage = createInfoImage(with: "feedback")
    private lazy var feedbackHeader = createHeaderLabel(with: "Обратная связь")
    private lazy var feedbackDescrtiption = createDescriptionLabel(with: "Задайте нам вопрос, мы на связи")
    private lazy var feedbackChevronImage = createChevronImage()
    
    private lazy var logInRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти / Зарегистрироваться", for: .normal)
        button.backgroundColor = UIColor(rgb: 0x133B45)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: view.frame.width * 0.045, weight: .semibold)
        button.layer.cornerRadius = view.frame.width * 0.03
        return button
    }()
    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    private lazy var versionImage: UIImageView = {
        let version = UIImageView()
        version.image = UIImage(systemName: "v.circle")
        version.tintColor = .gray
        return version
    }()
    
    private lazy var versionLabel: UILabel = {
        let version = UILabel()
        version.text = "Версия: 6.0.7 (3)"
        version.textColor = .gray
        version.font = .systemFont(ofSize: view.frame.width * 0.045)
        return version
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
        view.addSubview(shopsView)
        shopsView.addSubview(shopsImage)
        shopsView.addSubview(shopsHeader)
        shopsView.addSubview(shopsDescrtiption)
        shopsView.addSubview(shopsChevronImage)
        
        view.addSubview(transferView)
        transferView.addSubview(transferImage)
        transferView.addSubview(transferHeader)
        transferView.addSubview(transferDescritption)
        transferView.addSubview(transferChevronImage)
        
        view.addSubview(feedbackView)
        feedbackView.addSubview(feedbackImage)
        feedbackView.addSubview(feedbackHeader)
        feedbackView.addSubview(feedbackDescrtiption)
        feedbackView.addSubview(feedbackChevronImage)
        
        view.addSubview(logInRegisterButton)
        
        view.addSubview(hStackView)
        hStackView.addArrangedSubview(versionImage)
        hStackView.addArrangedSubview(versionLabel)
    }
    
    private func setupLayout() {
        
        //shopsView
        shopsView.translatesAutoresizingMaskIntoConstraints = false
        shopsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        shopsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        shopsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        shopsView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        
        shopsImage.translatesAutoresizingMaskIntoConstraints = false
        shopsImage.centerYAnchor.constraint(equalTo: shopsView.centerYAnchor).isActive = true
        shopsImage.leftAnchor.constraint(equalTo: shopsView.leftAnchor, constant: 20).isActive = true
        shopsImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.043).isActive = true
        shopsImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.053).isActive = true
        
        shopsHeader.translatesAutoresizingMaskIntoConstraints = false
        shopsHeader.topAnchor.constraint(equalTo: shopsView.topAnchor, constant: 13).isActive = true
        shopsHeader.leftAnchor.constraint(equalTo: shopsView.leftAnchor,
                                          constant: adaptationToiPodScreenSize(iPodValue: 50,
                                                                               defaultValue: 65)).isActive = true
        
        shopsDescrtiption.translatesAutoresizingMaskIntoConstraints = false
        shopsDescrtiption.topAnchor.constraint(equalTo: shopsHeader.bottomAnchor, constant: 2).isActive = true
        shopsDescrtiption.leftAnchor.constraint(equalTo: shopsView.leftAnchor,
                                                constant: adaptationToiPodScreenSize(iPodValue: 50,
                                                                                     defaultValue: 65)).isActive = true
        
        shopsChevronImage.translatesAutoresizingMaskIntoConstraints = false
        shopsChevronImage.centerYAnchor.constraint(equalTo: shopsView.centerYAnchor).isActive = true
        shopsChevronImage.rightAnchor.constraint(equalTo: shopsView.rightAnchor, constant: -20).isActive = true
        shopsChevronImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.025).isActive = true
        shopsChevronImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.045).isActive = true
        
        //transferView
        transferView.translatesAutoresizingMaskIntoConstraints = false
        transferView.topAnchor.constraint(equalTo: shopsView.bottomAnchor, constant: 20).isActive = true
        transferView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        transferView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        transferView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        
        transferImage.translatesAutoresizingMaskIntoConstraints = false
        transferImage.centerYAnchor.constraint(equalTo: transferView.centerYAnchor).isActive = true
        transferImage.leftAnchor.constraint(equalTo: transferView.leftAnchor, constant: 20).isActive = true
        transferImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.056).isActive = true
        transferImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.043).isActive = true
        
        transferHeader.translatesAutoresizingMaskIntoConstraints = false
        transferHeader.topAnchor.constraint(equalTo: transferView.topAnchor, constant: 13).isActive = true
        transferHeader.leftAnchor.constraint(equalTo: transferView.leftAnchor,
                                             constant: adaptationToiPodScreenSize(iPodValue: 50,
                                                                                  defaultValue: 65)).isActive = true
        
        transferDescritption.translatesAutoresizingMaskIntoConstraints = false
        transferDescritption.topAnchor.constraint(equalTo: transferHeader.bottomAnchor, constant: 2).isActive = true
        transferDescritption.leftAnchor.constraint(equalTo: transferView.leftAnchor,
                                                   constant: adaptationToiPodScreenSize(iPodValue: 50,
                                                                                        defaultValue: 65)).isActive = true
        transferDescritption.widthAnchor.constraint(equalTo: transferView.widthAnchor, multiplier: 0.7).isActive = true
        
        transferChevronImage.translatesAutoresizingMaskIntoConstraints = false
        transferChevronImage.centerYAnchor.constraint(equalTo: transferView.centerYAnchor).isActive = true
        transferChevronImage.rightAnchor.constraint(equalTo: transferView.rightAnchor, constant: -20).isActive = true
        transferChevronImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.025).isActive = true
        transferChevronImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.045).isActive = true
        
        //feedbackView
        feedbackView.translatesAutoresizingMaskIntoConstraints = false
        feedbackView.topAnchor.constraint(equalTo: transferView.bottomAnchor, constant: 20).isActive = true
        feedbackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        feedbackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        feedbackView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        
        feedbackImage.translatesAutoresizingMaskIntoConstraints = false
        feedbackImage.centerYAnchor.constraint(equalTo: feedbackView.centerYAnchor).isActive = true
        feedbackImage.leftAnchor.constraint(equalTo: feedbackView.leftAnchor, constant: 20).isActive = true
        feedbackImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.05).isActive = true
        feedbackImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.053).isActive = true
        
        feedbackHeader.translatesAutoresizingMaskIntoConstraints = false
        feedbackHeader.topAnchor.constraint(equalTo: feedbackView.topAnchor, constant: 13).isActive = true
        feedbackHeader.leftAnchor.constraint(equalTo: feedbackView.leftAnchor,
                                             constant: adaptationToiPodScreenSize(iPodValue: 50,
                                                                                  defaultValue: 65)).isActive = true
        
        feedbackDescrtiption.translatesAutoresizingMaskIntoConstraints = false
        feedbackDescrtiption.topAnchor.constraint(equalTo: feedbackHeader.bottomAnchor, constant: 2).isActive = true
        feedbackDescrtiption.leftAnchor.constraint(equalTo: feedbackView.leftAnchor,
                                                   constant: adaptationToiPodScreenSize(iPodValue: 50,
                                                                                        defaultValue: 65)).isActive = true
        
        feedbackChevronImage.translatesAutoresizingMaskIntoConstraints = false
        feedbackChevronImage.centerYAnchor.constraint(equalTo: feedbackView.centerYAnchor).isActive = true
        feedbackChevronImage.rightAnchor.constraint(equalTo: feedbackView.rightAnchor, constant: -20).isActive = true
        feedbackChevronImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.025).isActive = true
        feedbackChevronImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.045).isActive = true
        
        logInRegisterButton.translatesAutoresizingMaskIntoConstraints = false
        logInRegisterButton.topAnchor.constraint(equalTo: feedbackView.bottomAnchor, constant: 30).isActive = true
        logInRegisterButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        logInRegisterButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        logInRegisterButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.13).isActive = true
        
        versionImage.translatesAutoresizingMaskIntoConstraints = false
        versionImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.07).isActive = true
        versionImage.heightAnchor.constraint(equalTo: versionImage.widthAnchor).isActive = true
        
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25).isActive = true
        hStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(rgb: 0xF7F7F8)
        title = "Моя информация"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    //MARK: - Functions
    
    private func createInfoView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = self.view.frame.width * 0.03
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 10
        return view
    }
    
    private func createHeaderLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: view.frame.width * 0.04)
        return label
    }
    
    private func createDescriptionLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: view.frame.width * 0.033, weight: .light)
        label.alpha = 0.5
        return label
    }
    
    private func createInfoImage(with name: String) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: name)
        return image
    }
    
    private func createChevronImage() -> UIImageView {
        let chevron = UIImageView()
        chevron.image = UIImage(systemName: "chevron.forward")
        chevron.tintColor = .black
        return chevron
    }
    
    private func adaptationToiPodScreenSize(iPodValue: CGFloat, defaultValue: CGFloat) -> CGFloat {
        let device = UIDevice()
        if device.name == "iPod touch (7th generation)" {
            return iPodValue
        } else {
            return defaultValue
        }
    }
}

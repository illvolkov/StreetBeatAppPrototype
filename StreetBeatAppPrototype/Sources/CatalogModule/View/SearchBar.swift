//
//  SearchBar.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

import UIKit

class SearchBar: UITextField {
    
    init() {
        super.init(frame: .zero)
        self.configureTextField()
        self.configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField() {
        backgroundColor = UIColor(rgb: 0xEBEEF1)
        placeholder = "Что ты ищешь?"
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
    
    private func configureViews() {
        
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
        
        leftViewMode = UITextField.ViewMode.always
        rightViewMode = UITextField.ViewMode.always
        leftView = glassView
        rightView = qrCodeView
    }
}

//
//  Product.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

struct Product {
    let image: String?
    let description: String?
    let header: String?
    let lookLabel: String?
    
    init(image: String?, description: String?, header: String?) {
        self.image = image
        self.description = description
        self.header = header
        
        if header == "Собрали все самое интересное" ||
            header == "adidas Forum" ||
            header == "Открывайте новое" ||
            header == "Подборка рюкзаков" ||
            header == "adidas Originals x Parley" {
            lookLabel = "Посмотреть"
        } else if header == "Привет! Это «Эй, Йоу!»" {
            lookLabel = "Послушать"
        } else {
            lookLabel = nil
        }
    }
}

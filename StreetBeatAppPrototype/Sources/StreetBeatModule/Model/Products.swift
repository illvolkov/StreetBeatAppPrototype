//
//  Products.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 05.09.2022.
//

class Products {
    static func getData() -> [ProductSection] {
        return [
            ProductSection(type: .story, product: [
                Product(image: "story", description: nil, header: nil)
            ]),
            ProductSection(type: .product, product: [
                Product(image: "most.interesting", description: nil, header: "Собрали все самое интересное"),
                Product(image: "adidas.forum", description: nil, header: "adidas Forum"),
                Product(image: "open.new", description: "Вместе с аутфитами от PUMA", header: "Открывайте новое"),
                Product(image: "backpacks", description: "Готовимся к осени", header: "Подборка рюкзаков"),
                Product(image: "hello", description: nil, header: "Привет! Это «Эй, Йоу!»"),
                Product(image: "minecraft", description: "прямиком из игры", header: "PUMA x Minecraft")
            ]),
            ProductSection(type: .ad, product: [
                Product(image: "sbp", description: nil, header: nil)
            ]),
            ProductSection(type: .product, product: [
                Product(image: "mirage.sport", description: "Новые цвета!", header: "PUMA Mirage Sport"),
                Product(image: "adidas.new", description: nil, header: "Новинки adidas Originals"),
                Product(image: "bags", description: "Гуляем летом на легке", header: "Поясные сумки")
            ]),
            ProductSection(type: .ad, product: [
                Product(image: "podcast", description: nil, header: nil)
            ]),
            ProductSection(type: .picture, product: [
                Product(image: "solemate", description: nil, header: nil)
            ]),
            ProductSection(type: .product, product: [
                Product(image: "parley", description: nil, header: "adidas Originals x Parley")
            ]),
            ProductSection(type: .picture, product: [
                Product(image: "ozweego", description: nil, header: nil),
                Product(image: "info", description: nil, header: nil)
            ]),
            ProductSection(type: .button, product: [
                Product(image: nil, description: nil, header: "Политика конфиденциальности"),
                Product(image: nil, description: nil, header: "Оферта")
            ]),
            ProductSection(type: .info, product: [
                Product(image: "car", description: "Доставка от 350 руб.", header: "Подробнее о доставке и оплате"),
                Product(image: "arrow", description: "Обмен и возврат", header: "Подробнее об условиях возврата"),
                Product(image: "cloud", description: "Обратная связь", header: "Ответим на все вопросы")
            ])
        ]
    }
}

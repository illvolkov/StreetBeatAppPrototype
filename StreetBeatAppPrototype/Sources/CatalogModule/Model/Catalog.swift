//
//  Catalog.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 03.09.2022.
//


struct Catalog {
    let title: String
    let image: String
}

class Catalogs {
    static func getData() -> [Catalog] {
        return [
            Catalog(title: "Обувь", image: "shoes"),
            Catalog(title: "Одежда", image: "odejda"),
            Catalog(title: "Аксессуары", image: "kepka"),
            Catalog(title: "Бренды", image: "brands")
        ]
    }
}

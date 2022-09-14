//
//  Catalogs.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 05.09.2022.
//

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

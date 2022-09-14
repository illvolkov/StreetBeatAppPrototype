//
//  CatalogViewModel.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 03.09.2022.
//

class CatalogViewModel {
    var model = Observable([Catalog]())
    
    func fetchData() {
        let model = Catalogs.getData()
        self.model.value = model
    }
}

//
//  StreetBeatViewModel.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

class StreetBeatViewModel {
    let model = Observable([ProductSection]())
    
    func fetchData() {
        let model = Products.getData()
        self.model.value = model
    }
}

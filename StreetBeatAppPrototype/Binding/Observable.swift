//
//  Dynamic.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

class Observable<T> {
    typealias Listener = (T?) -> Void
    
    private var listener: Listener?
    
    func bind(_ listener: @escaping Listener) {
        listener(value)
        self.listener = listener
    }
    
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
}

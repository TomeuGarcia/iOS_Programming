//
//  Observable.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 19/4/24.
//

import Foundation


class Observable<T> {
    
    typealias Observation = (_ lastValue: T, _ newValue: T) -> ()
    typealias Restriction = (_ lastValue: T, _ newValue: T) -> (T)
    
    private var observationsMap: Dictionary<Int, Observation> = Dictionary()
    private var autoId: Int = 0
    
    private let setRestriction: Restriction?
    
    private var value: T
    public var Value: T {
        get {
            return self.value
        }
        set {
            let lastValue = self.value
            self.value = self.setRestriction?(lastValue, newValue) ?? newValue
            self.callAllObservables(lastValue: lastValue, newValue: self.value)
        }
    }
    
    init(_ initialValue: T, setRestriction: Restriction? = nil) {
        self.value = initialValue
        self.setRestriction = setRestriction
    }
    
    
    @discardableResult
    public func addObservation(_ observation: @escaping Observation) -> Int {
        let newId = self.autoId
        self.autoId += 1
        
        self.observationsMap[newId] = observation
                
        return newId
    }

    public func removeObservation(id: Int) {
        self.observationsMap.removeValue(forKey: id)
    }
    
    public func removeAllObservations() {
        self.observationsMap.removeAll()
    }
    
    private func callAllObservables(lastValue: T, newValue: T) {
        let keys = self.observationsMap.keys
        for key in keys {
            self.observationsMap[key]?(lastValue, lastValue)
        }
    }
    
}

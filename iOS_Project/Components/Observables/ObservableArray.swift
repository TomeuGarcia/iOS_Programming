//
//  ObservableList.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 19/4/24.
//

import Foundation


class ObservableArray<T> {
    
    typealias Observation = (_ lastValue: [T], _ newVAlue: [T], _ affectedValue: T?) -> ()
    
    var observationsMap: Dictionary<Int, Observation> = Dictionary<Int, Observation>()
    var autoId: Int = 0
    
    var elements: [T] = []
    /*
    public var Elements: [T] {
        get {
            return self.elements
        }
        set {
            let lastValue = self.elements
            self.elements = newValue
            self.callAllObservations(lastValue: lastValue, newValue: self.elements)
        }
    }
     */
    
    init(_ initialValue: [T]) {
        self.elements = initialValue
    }
    
    @inlinable
    public subscript(index: Int) -> T? {
        
        get {
            return (index >= self.elements.count || index < 0)
                ? nil
                : self.elements[index]
        }
        
        set {
            if let value = newValue, (index < self.elements.count && index >= 0 ) {
                let lastValue = self.elements
                self.elements[index] = value
                self.callAllObservations(lastValue: lastValue, newValue: self.elements, affectedValue: value)
            }
        }
        
    }
    
    public func append(_ newItem: T) {
        let lastValue = self.elements
        self.elements.append(newItem)
        
        self.callAllObservations(lastValue: lastValue, newValue: self.elements, affectedValue: newItem)
    }



    
    
    
    @discardableResult
    public func addObservation(_ observation: @escaping Observation) -> Int {
        let newId = self.autoId
        self.autoId += 1
        
        self.observationsMap[newId] = observation
        
        return newId
    }
    
    private func callAllObservations(lastValue: [T], newValue: [T], affectedValue: T? = nil) {
        for key in self.observationsMap.keys {
            self.observationsMap[key]?(lastValue, newValue, affectedValue)
        }
    }
    
    public func removeObservation(id: Int) {
        self.observationsMap.removeValue(forKey: id)
    }
 
    public func removeAllObservations() {
        self.observationsMap.removeAll()
    }
    
}


extension ObservableArray where T : Equatable {
    
    internal func firstIndexOf(_ item: T) -> Int? {
        return self.elements.firstIndex(of: item)
    }
    
    internal func removeFirst(_ item: T) -> Bool {
        if let index = self.elements.firstIndex(of: item) {
            let lastValue = self.elements
            self.elements.remove(at: index)
            self.callAllObservations(lastValue: lastValue, newValue: self.elements, affectedValue: item)
            
            return true
        }
        
        return false
    }
}

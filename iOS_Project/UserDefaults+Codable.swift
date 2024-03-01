//
//  UserDefaults+Codable.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 1/3/24.
//

import Foundation

extension UserDefaults {
    
    @discardableResult
    func save(_ data: Codable, key: String) -> Bool {
        
        let encoder = JSONEncoder()
        
        if let encodedData: Data = try? encoder.encode(data) {
            self.set(encodedData, forKey: key)
            return true
        }
        
        return false
    }
    
    
    func read<T : Codable> (_ t: T.Type, key: String) -> T? {
        
        if let encodedData: Data = self.object(forKey: key) as? Data {
            
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(t, from: encodedData) {
                return data
            }
            
        }
        
        return nil
    }
    
    
}

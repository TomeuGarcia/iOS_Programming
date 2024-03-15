//
//  Hero.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 15/3/24.
//

import Foundation


struct Hero : Codable {
    let id: Int
    let name: String
    let description: String
}


extension MarvelApiRepository {
    
    struct HeroesFetchData : Codable {
        let offset: Int
        let limit: Int
        let total: Int
        let count: Int
        let results: [Hero]
    }
    
    struct HeroesResponse : Codable {
        let code: Int
        let data: HeroesFetchData
    }
    
}

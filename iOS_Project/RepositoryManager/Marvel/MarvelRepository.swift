//
//  MarvelRepository.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 15/3/24.
//

import Foundation


protocol MarvelRepository {
    
    typealias HeroesResponse = ([Hero]) -> ()
    
    
    func getHeroes(offset: Int, limit: Int, onSuccess: @escaping HeroesResponse)
    
}

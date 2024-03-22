//
//  +Hero.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 15/3/24.
//

import Foundation

extension MarvelApiRepository {
    
    
    
    func getHeroes(offset: Int = 0, limit: Int = 20, onSuccess: @escaping MarvelRepository.HeroesResponse) {
        
        let marvelComponents = MarvelURLComponents()
        marvelComponents
            .addToPath(.Characters)
            .addOffset(offset)
            .addLimit(limit)
        
        
        if let url = marvelComponents.Components?.url
        {
            
            URLSession.getData(url: url) { response in
                let result: HeroesResponse = response
                onSuccess(result.data.results, result.data.total)
                
            } onFailure: { error in }
             
        }
        
    }
    
    
}

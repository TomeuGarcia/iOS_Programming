//
//  HeroesListVC.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 8/3/24.
//

import Foundation
import UIKit

struct Pokemon : Codable {
    let name: String
    let sprites: PokemonSprites
}

struct PokemonSprites : Codable {
    let back: String
    let front: String
    
    enum CodingKeys : String, CodingKey {
        case back = "back_default"
        case front = "front_default"
    }
}



struct Digimon : Codable {
    let id: Int
    let name: String
    let types: [DigimonTypes]
    let skills: [DigimonSkills]
}

struct DigimonTypes : Codable {
    let id: Int
    let type: String
}

struct DigimonSkills : Codable {
    let id: Int
    let skill: String
    let description: String
}





class HeroesListVC : VC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callPokemon()
    }
    
    
    
    func callPokemon() {
        
        if let url = URL(string: "https://pokeapi.co/api/v2/pokemon/charizard")
        {
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let data = data, let jsonString = String(data: data, encoding: .utf8) {
                    
                    if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) {
                        
                        DispatchQueue.main.async {
                            
                            print(pokemon)
                            
                        }
                    }
                }
                
                
            }
            
            task.resume()
        }
        
    }
    
    
    func callDigimon() {
        
        if let url = URL(string: "https://digi-api.com/api/v1/digimon/289")
        {
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let data = data, let jsonString = String(data: data, encoding: .utf8) {
                    
                    if let digimon = try? JSONDecoder().decode(Digimon.self, from: data) {
                        
                        DispatchQueue.main.async {
                            
                            print(digimon)
                            
                        }
                    }
                }
                
                
            }
            
            task.resume()
        }
        
    }
    
    
    func call<T : Codable>(t : T, urlString: String) {
        
        if let url = URL(string: urlString)
        {
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let data = data, let jsonString = String(data: data, encoding: .utf8) {
                    
                    if let digimon = try? JSONDecoder().decode(T.self, from: data) {
                        
                        DispatchQueue.main.async {
                            
                            print(digimon)
                            
                        }
                    }
                }
                
                
            }
            
            task.resume()
        }
        
    }
    
    
}

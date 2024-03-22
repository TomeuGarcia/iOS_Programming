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
    
    
    @IBOutlet weak var table: UITableView!
    
    
    
    var heroes: [Hero] = []
    var callInProgress: Bool = false
    var totalOfHeroes: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        
        getMoreHeroes()
    }
    
    func getMoreHeroes() {
        
        if (callInProgress) {
            return
        }
        
        var currentLimit = 20
        if let totalOfHeroes = totalOfHeroes {
            let pendingHeroes = totalOfHeroes - heroes.count
            
            if (pendingHeroes <= 0) {
                return
            }
            
            if (pendingHeroes < currentLimit) {
                currentLimit = pendingHeroes
            }
        }
        
        self.callInProgress = true
        
        RepoManager.Marvel.getHeroes(offset: self.heroes.count, limit: currentLimit) 
        { heroes, total in
            self.heroes.insert(contentsOf: heroes, at: self.heroes.count)
            self.table.reloadData()
            
            self.callInProgress = false
        }
        
    }

    
}


extension HeroesListVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = indexPath.row % 2 == 0 ? "HeroCellLeft" : "HeroCellRight"
        guard let heroCell =
                tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? HeroCell
        else {
            return Cell()
        }
        
        heroCell.setupWithHero(hero: heroes[indexPath.row])
        
        if (heroes.count - indexPath.row <= 5) {
            getMoreHeroes()
        }
        
        return heroCell
    }
    
}

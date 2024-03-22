//
//  HeroCell.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 22/3/24.
//

import Foundation
import UIKit

class HeroCell : Cell {
    
    
    @IBOutlet weak var heroImage: ImageView!
    
    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var descriptionText: UITextView!
    
    
    
    public func setupWithHero(hero: Hero) {
        
        if let url = hero.thumbnail.Url {
            heroImage.setImageAsync(url: url)
        }
        
        nameText.text = hero.name
        descriptionText.text = hero.description
    }
    
    
}

//
//  String+Translations.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 5/4/24.
//

import Foundation


extension String {
    
    var Translated: String {
        get {
            return NSLocalizedString(self, comment: "Translated")
        }
    }
    
}

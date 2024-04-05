//
//  Label.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 5/4/24.
//

import Foundation
import UIKit

class Label : UILabel {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    init(_ text: String = "", style: UIFont.TextStyle = .body) {
        super.init(frame: .zero)
        self.activateConstraints()
        self.adjustsFontForContentSizeCategory = true // When the font size changes, this auto-resizes
        
        self.font = .fontByStyle(style)
        self.text = text // TODO translation key
        
        self.isUserInteractionEnabled = false
    }

}

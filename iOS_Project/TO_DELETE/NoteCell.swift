//
//  NoteCell.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 23/2/24.
//

import Foundation
import UIKit

class NoteCell : ButtonCell {
    
    @IBOutlet weak var TitleText: UILabel!
    @IBOutlet weak var Content: UITextView!
    
    
    func update(title: String, content: String) {
        TitleText.text = title
        Content.text = content
    }
    
    func update(_ note: Note) {
        self.update(title: note.title, content: note.content)
    }

    
}

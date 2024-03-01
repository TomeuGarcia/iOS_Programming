//
//  NoteCell.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 23/2/24.
//

import Foundation
import UIKit

class NoteCell : UITableViewCell {
    
    @IBOutlet weak var TitleText: UILabel!
    @IBOutlet weak var Content: UITextView!
    
    
    func updateWithNote(_ note: Note) {
        TitleText.text = note.title
        Content.text = note.content
    }

    
}

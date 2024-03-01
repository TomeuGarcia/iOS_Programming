//
//  NoteDetailVC.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 1/3/24.
//

import Foundation
import UIKit

class NoteDetailVC : UIViewController {
    
    enum DetailMode {
        case create
        case update
    }
    
    typealias OnSave = (String, String) -> ()
    typealias OnCancel = () -> ()
    
    
    var mode: DetailMode = .create
    var onSave: OnSave?
    var onUpdate: OnSave?
    var onCancel: OnCancel?
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentField: UITextView!
    
    @IBOutlet weak var acceptButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func cancelAction(_ sender: Any) {
        
        self.onCancel?()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        let title: String = titleField.text ?? ""
        let content: String = contentField.text ?? ""
        
        switch (self.mode) {
        case .create:
            self.onSave?(title, content)
            break
        case.update:
            self.onUpdate?(title, content)
            break
        }        
        
    }
    
    
    func clear() {
        titleField.text = ""
        contentField.text = ""
    }
    
    func prepare(title: String, content: String) {
        titleField.text = title
        contentField.text = content
    }
    
    func setMode(mode: DetailMode) {
        self.mode = mode
        
        switch(self.mode) {
        case .create:
            acceptButton.setTitle("Save", for: .normal)
            break
        case .update:
            acceptButton.setTitle("Update", for: .normal)
            break
        }
        
    }
    
    
}

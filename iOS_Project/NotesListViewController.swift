//
//  NotesListViewController.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 23/2/24.
//

import Foundation
import UIKit

class NotesListViewController : ViewController,
    UITableViewDataSource,
    UITableViewDelegate
{
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var AddNoteButton: UIButton!
    var notesList: [Note] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        loadSavedNotes()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell : NoteCell =
                tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
                as? NoteCell
        else {
            return UITableViewCell()
        }
        
        cell.updateWithNote(notesList[indexPath.row])
        
        return cell
    }
    
    
    @IBAction func AddNoteButtonPressed(_ sender: Any) {
        addNote()
        table.reloadData()
        
        saveCurrentNotes()
    }
    
    
    
    func addNote() {
        notesList.append(
            Note(title: "Note Title \(notesList.count)",
                 content: "Note Content \(notesList.count)")
        )
    }
    
    func loadSavedNotes() {
        let defaults = UserDefaults.standard
        if let tempNotesList = defaults.read([Note].self, key: "NotesSaved") {
            notesList = tempNotesList
        }
    }
    
    func saveCurrentNotes() {
        let defaults = UserDefaults.standard
        defaults.save(notesList, key: "NotesSaved")
        defaults.synchronize()
    }
    
}

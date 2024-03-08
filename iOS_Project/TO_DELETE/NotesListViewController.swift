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
    var noteDetailVC: NoteDetailVC?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        loadSavedNotes()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let noteDetailVC = storyboard.instantiateViewController(withIdentifier: "NoteDetailVC")
            as? NoteDetailVC {
            noteDetailVC.onCancel = {
                noteDetailVC.dismiss(animated: true)
            }
            
            noteDetailVC.onSave = { title, content in
                self.addNote(title: title, content: content)
                self.table.reloadData()
                self.saveCurrentNotes()
                noteDetailVC.dismiss(animated: true)
            }
            
            self.noteDetailVC = noteDetailVC
        }       
        
        
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
        
        let note: Note = notesList[indexPath.row]
        cell.update(note)
        cell.onClick = {
            self.openNote(note, cell)
        }
        
        return cell
    }
    
    
    @IBAction func AddNoteButtonPressed(_ sender: Any) {
        
        if let noteDetailVC = self.noteDetailVC {
            self.present(noteDetailVC, animated: true)
            noteDetailVC.setMode(mode: .create)
            noteDetailVC.clear()
        }
    }
    
    func openNote(_ note: Note, _ cell: NoteCell) {
        
        if let noteDetailVC = self.noteDetailVC {
            
            self.present(noteDetailVC, animated: true)
            noteDetailVC.setMode(mode: .update)
            
            noteDetailVC.onUpdate = { title, content in
                cell.update(note)
                self.saveCurrentNotes()
                noteDetailVC.dismiss(animated: true)
            }
            
            noteDetailVC.prepare(title: note.title, content: note.content)
        }
    }
    
    
    
    func addNote(title: String, content: String) {
        notesList.append(
            Note(title: title,
                 content: content)
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

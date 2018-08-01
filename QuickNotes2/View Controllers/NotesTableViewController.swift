//
//  NotesTableViewController.swift
//  QuickNotes2
//
//  Created by Lisa Sampson on 8/1/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController, NoteTableViewCellDelegate {
    
    func shareNote(for cell: NoteTableViewCell) {
        guard let note = cell.note else { return }
        
        let text = note.text
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteController.notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        guard let noteCell = cell as? NoteTableViewCell else { return cell }
        let note = noteController.notes[indexPath.row]
        
        noteCell.note = note
        noteCell.delegate = self

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    @IBAction func saveNote(_ sender: Any) {
        
        guard let text = noteTextView.text else { return }
        noteController.createNote(with: text)
        
        tableView.reloadData()
    }
    
    let noteController = NoteController()
    
    @IBOutlet weak var noteTextView: UITextView!
    
}

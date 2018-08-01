//
//  NoteTableViewCell.swift
//  QuickNotes2
//
//  Created by Lisa Sampson on 8/1/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import UIKit

protocol NoteTableViewCellDelegate: class {
    // This protocol function will only run inside the shareNote button on this cell
    func shareNote(for cell: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell {
    
    @IBAction func shareNote(_ sender: Any) {
        
            delegate?.shareNote(for: self)
        
    }
    
    private func updateViews() {
        //Take the model object, unwrap it, and set its properties inside the outlets.
        
        guard let note = note else { return }
        
        noteTextLabel.text = note.text
    }
    
    weak var delegate: NoteTableViewCellDelegate?
    
    var note: Note? {
        didSet { // Will update views everytime there is an new note
            updateViews()
        }
    }
    
    @IBOutlet weak var noteTextLabel: UILabel!
    
}

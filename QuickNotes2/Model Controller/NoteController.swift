//
//  NoteController.swift
//  QuickNotes2
//
//  Created by Lisa Sampson on 8/1/18.
//  Copyright © 2018 Lisa Sampson. All rights reserved.
//

import Foundation

class NoteController {
    
    func createNote(with text: String) {
        let newNote = Note(text: text)
        
        notes.append(newNote)
    }
    
    func delete(note: Note) {
        
        guard let index = notes.index(of: note) else { return }
        
        notes.remove(at: index)
    }
    
    // This is the data source for the application
    var notes: [Note] = []
}

//
//  NotesViewModel.swift
//  TodoList
//
//  Created by Derlis Ramón Cañete Ríos on 2023-04-12.
//

import Foundation

final class NotesViewModel: ObservableObject {
    @Published var notes: [NoteModel] = []
    
    init() {
        notes = getAllNotes()
    }
    
    func saveNote(description: String) {
        let newNote = NoteModel(description: description)
        notes.append(newNote)
        
        encodeAndsaveAllNotes()
    }
    
    private func encodeAndsaveAllNotes() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: "notes")
        }
    }
    
    func getAllNotes() -> [NoteModel] {
        if let noteData = UserDefaults.standard.object(forKey: "notes") as? Data {
            if let notes = try? JSONDecoder().decode([NoteModel].self, from: noteData) {
                return notes
            }
        }
        return []
    }
}

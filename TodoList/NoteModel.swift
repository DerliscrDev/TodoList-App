//
//  NoteModel.swift
//  TodoList
//
//  Created by Derlis Ramón Cañete Ríos on 2023-04-12.
//

import Foundation

struct NoteModel: Codable {
    let id: String
    var isFavorited: Bool
    let description: String
    
    init(id: String = UUID().uuidString, isFavorited: Bool = false, description: String) {
        self.id = id
        self.isFavorited = isFavorited
        self.description = description
    }
}

//
//  ContentView.swift
//  TodoList
//
//  Created by Derlis Ramón Cañete Ríos on 2023-04-12.
//

import SwiftUI

struct ContentView: View {
    
    @State var descriptionNote: String = ""
    @StateObject var notesViewModel = NotesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Añade una tarea")
                    .underline()
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                    TextEditor(text: $descriptionNote)
                    .foregroundColor(.gray)
                    .frame(height: 100)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.green, lineWidth: 2)
                    }
                    .padding(.horizontal, 12)
                    .cornerRadius(3)
                Button {
                    notesViewModel.saveNote(description: descriptionNote)
                    descriptionNote = ""
                } label: {
                    Text("Crear")
                }
                .buttonStyle(.bordered)
                .tint(.green)
                
                Spacer()
                
                List {
                    ForEach($notesViewModel.notes, id: \.id) { $note in
                        HStack {
                            if note.isFavorited {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            Text(note.description)
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                notesViewModel.updateFavoriteNote(note: $note)
                            } label: {
                                Label("Favorito", systemImage: "star.fill")
                            }
                            .tint(.yellow)
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                notesViewModel.removeNote(withId: note.id)
                            } label: {
                                Label("Borrar", systemImage: "trash.fill")
                            }
                            .tint(.red)
                            
                        }
                        
                    }
                }
            }
            .navigationTitle("TODO")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 25, height: 25)
                    
                    Text(notesViewModel.getNumbersOfNotes())
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .bold()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

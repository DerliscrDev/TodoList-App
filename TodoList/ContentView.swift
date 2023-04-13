//
//  ContentView.swift
//  TodoList
//
//  Created by Derlis Ramón Cañete Ríos on 2023-04-12.
//

import SwiftUI

struct ContentView: View {
    
    @State var descriptionNote: String = ""
    
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
                    descriptionNote = ""
                } label: {
                    Text("Crear")
                }
                .buttonStyle(.bordered)
                .tint(.green)
                
                Spacer()
            }
            .navigationTitle("TODO")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

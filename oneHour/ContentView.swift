//
//  ContentView.swift
//  oneHour
//
//  Created by Vinicius Paldês on 23/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var formIsOpen: Bool = false
    @State private var itemFormName: String =  ""
    @State private var items: [Item] = []
    
    func emptyForm() {
        itemFormName = ""
        formIsOpen = false
    }
    
    var body: some View {
        VStack {
            ItemList(items: items)
            Button("Create new item") {
                formIsOpen = true
            }.sheet(isPresented: $formIsOpen) {
                Form {
                    Section( header: Text("Item Details")) {
                        TextField("name", text: $itemFormName)
                        Button("Save") {
                            items.append(Item(id: UUID(), name: itemFormName))
                            emptyForm()
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

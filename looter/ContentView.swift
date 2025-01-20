//
//  ContentView.swift
//  looter
//
//  Created by Pham Huynh Tuong Vy on 20/01/2025.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot = ["Epée", "Bouclier", "Armure"]
    
    func addItem(item: String) {
        loot.append(item)
    }
}

struct InventoryView: View {
    let inventory: [LootItem]

    var body: some View {
        List(inventory, id: \.name) { item in
            NavigationLink(
                destination: AddItemView()
            ) {
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundStyle(item.rarity.color)
                    VStack(alignment: .leading) {
                        Text(item.name).font(.headline)
                        Text("Quantité: \(item.quantity)").font(.subheadline)
                    }
                    Spacer()
                    Text(item.type.emoji)
                    
                }
            }
            
        }
        .navigationTitle("🧳 Inventaire")
    }
}

struct ContentView: View {
 
    @State var showAddItemView: Bool = false
    
    @StateObject var inventory = Inventory()
    
    var body: some View {
        
        NavigationStack {
//            List {
//                Button(action: {
//                    inventory.addItem(item: "Magie de feu")
//                }, label: {
//                    Text("Ajouter")
//                })
//                
//                ForEach(inventory.loot, id: \.self) { item in
//                    Text(item)
//                }
//                
//            }
            InventoryView(inventory: predefinedInventory)
            
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView()
                    .environmentObject(inventory)
            })
            .navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
            .toolbar(content: { // La barre d'outil de notre page
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle() // L'action de notre bouton
                        print(showAddItemView)
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
            
        }
        
    }
}

#Preview {
    ContentView()
}

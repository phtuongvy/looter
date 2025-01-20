//
//  AddItemView.swift
//  looter
//
//  Created by Pham Huynh Tuong Vy on 20/01/2025.
//

import SwiftUI

struct AddItemView: View {
    
    @State private var name: String = ""
    @State private var rarity: Rarity = .common
    
    @State private var game: String = Game.emptyGame.name
    @State private var value: Int = 0
    
    @State private var type: ItemType = .unknown
    
    @State private var showIncrementAttack: Bool = false
    
    @EnvironmentObject private var inventory: Inventory
    @Environment(\.dismiss) private var dismiss
    
    func incrementStep() {
        value += 1
    }
    
    func decrementStep() {
        value -= 1
    }
    
    var body: some View {
        NavigationStack
        {
            Form {
                Section {
                    TextField("Nom de l'objet", text: $name)
                    Picker("Rareté", selection: $rarity) {
                        ForEach(Rarity.allCases, id: \.self) { rarity in
                            Text(String(describing: rarity).capitalized)
                        }
                    }
                }
                
                Section {
                    Picker ("Jeu", selection: $game) {
                        ForEach(availableGames, id: \.name) {
                            game in Text(String(String(describing: game)))
                        }
                    }
                    Stepper {
                        Text("Combien: \(value)")
                    } onIncrement: {
                        incrementStep()
                    } onDecrement: {
                        decrementStep()
                    }
                }
                
                Section {
                    
                    Picker("Type", selection: $type) {
                        ForEach(ItemType.allCases, id: \.self ) { type in
                            Text(type.emoji).tag(type)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Toggle("Item d'attaque ?", isOn: $showIncrementAttack)
                    
                if showIncrementAttack {
                    Stepper {
                        Text("Force d'attaque: \(value)")
                    } onIncrement: {
                        incrementStep()
                    } onDecrement: {
                        decrementStep()
                    }
                }
                
            }
        }
        .navigationTitle("Ajouter un loot")
        Button("Ajouter") {
            inventory.addItem(item: name)
            dismiss()
        }
    }
}

enum Rarity: String, CaseIterable {
    case common
    case uncommon
    case rare
    case epic
    case legendary
    case unique
    
    var color: Color {
        switch self {
        case .common: return .brown
        case .uncommon: return .gray
        case .rare: return .blue
        case .epic: return .orange
        case .legendary: return .red
        case .unique: return .black
        }
    }
}


#Preview {
    AddItemView()
}

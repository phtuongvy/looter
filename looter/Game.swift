//
//  Game.swift
//  looter
//
//  Created by Pham Huynh Tuong Vy on 20/01/2025.
//
import Foundation

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "Non spécifié", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames: [Game] = [
    Game(name: "Elden Ring", genre: .rpg, coverName: nil),
    Game(name: "Skyrim", genre: .rpg, coverName: nil),
    Game(name: "WoW", genre: .mmorpg, coverName: nil),
    Game(name: "CS:GO", genre: .fps, coverName: nil),
    Game(name: "Diablo IV", genre: .looter, coverName: nil)
]

let predefinedInventory: [LootItem] = [
    LootItem(quantity: 3, name: "Fire Sword", type: .fire, rarity: .rare, attackStrength: 50, game: availableGames[0]),
    LootItem(quantity: 1, name: "Ice Amulet", type: .ice, rarity: .epic, attackStrength: nil, game: availableGames[1]),
    LootItem(quantity: 5, name: "Thunder Bow", type: .thunder, rarity: .legendary, attackStrength: 70, game: availableGames[2]),
    LootItem(quantity: 2, name: "Poison Dagger", type: .poison, rarity: .uncommon, attackStrength: 30, game: availableGames[3]),
    LootItem(quantity: 1, name: "Shield of Valor", type: .shield, rarity: .unique, attackStrength: nil, game: availableGames[4])
]

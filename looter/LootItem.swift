//
//  LootItem.swift
//  looter
//
//  Created by Pham Huynh Tuong Vy on 20/01/2025.
//

import Foundation

struct LootItem {
    let id: UUID = UUID()
    var quantity: Int = 1
    var name: String
    var type: ItemType
    var rarity: Rarity
    var attackStrength: Int?
    var game: Game
    
}

enum ItemType: String, CaseIterable {
    
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknown = "🎲"
    
    var emoji: String {
        return self.rawValue
    }
    
}

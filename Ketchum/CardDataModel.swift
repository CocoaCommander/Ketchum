//
//  CardDataModel.swift
//  Ketchum
//
//  Created by Ryan Lee on 6/2/21.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cardDataModel = try? newJSONDecoder().decode(CardDataModel.self, from: jsonData)

import Foundation

// MARK: - CardDataModel
struct CardDataModel: Codable {
    let data: [Datum]?
    let page, pageSize, count, totalCount: Int?
}

// Datum.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let datum = try? newJSONDecoder().decode(Datum.self, from: jsonData)

import Foundation

// MARK: - Datum
struct Datum: Codable {
    let id, name, supertype: String?
    let subtypes: [Subtype]?
    let hp: String?
    let types: [Energy]?
    let evolvesFrom: String?
    let rules: [String]?
    let attacks: [Attack]?
    let weaknesses: [Resistance]?
    let retreatCost: [Energy]?
    let convertedRetreatCost: Int?
    let datumSet: Set?
    let number, artist, rarity: String?
    let nationalPokedexNumbers: [Int]?
    let legalities: Legalities?
    let images: DatumImages?
    let tcgplayer: Tcgplayer?
    let resistances: [Resistance]?

    enum CodingKeys: String, CodingKey {
        case id, name, supertype, subtypes, hp, types, evolvesFrom, rules, attacks, weaknesses, retreatCost, convertedRetreatCost
        case datumSet = "set"
        case number, artist, rarity, nationalPokedexNumbers, legalities, images, tcgplayer, resistances
    }
}

// Attack.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let attack = try? newJSONDecoder().decode(Attack.self, from: jsonData)

import Foundation

// MARK: - Attack
struct Attack: Codable {
    let name: String?
    let cost: [Energy]?
    let convertedEnergyCost: Int?
    let damage, text: String?
}

// RetreatCost.swift

import Foundation


enum Energy: String, Codable {
    case colorless = "Colorless"
    case darkness = "Darkness"
    case dragon = "Dragon"
    case fairy = "Fairy"
    case fighting = "Fighting"
    case fire = "Fire"
    case grass = "Grass"
    case lightning = "Lightning"
    case metal = "Metal"
    case psychic = "Psychic"
    case water = "Water"
}

// Set.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let set = try? newJSONDecoder().decode(Set.self, from: jsonData)

import Foundation

// MARK: - Set
struct Set: Codable {
    let id, name, series: String?
    let printedTotal, total: Int?
    let legalities: Legalities?
    let ptcgoCode, releaseDate, updatedAt: String?
    let images: SetImages?
}

// SetImages.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let setImages = try? newJSONDecoder().decode(SetImages.self, from: jsonData)

import Foundation

// MARK: - SetImages
struct SetImages: Codable {
    let symbol, logo: String?
}

// Legalities.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let legalities = try? newJSONDecoder().decode(Legalities.self, from: jsonData)

import Foundation

// MARK: - Legalities
struct Legalities: Codable {
    let unlimited, standard, expanded: Expanded?
}

// Expanded.swift

import Foundation


enum Expanded: String, Codable {
    case legal = "Legal"
    case banned = "Banned"
}

// DatumImages.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let datumImages = try? newJSONDecoder().decode(DatumImages.self, from: jsonData)

import Foundation

// MARK: - DatumImages
struct DatumImages: Codable {
    let small, large: String?
}

// Resistance.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let resistance = try? newJSONDecoder().decode(Resistance.self, from: jsonData)

import Foundation

// MARK: - Resistance
struct Resistance: Codable {
    let type: Energy?
    let value: String?
}

// Subtype.swift

import Foundation

// TODO: add all subtypes
enum Subtype: String, Codable {
    case brk = "BREAK"
    case baby = "Baby"
    case basic = "Basic"
    case ex = "EX"
    case gx = "GX"
    case goldenRodGameCorner = "Goldenrod Game Corner"
    case item = "Item"
    case legend = "LEGEND"
    case levelUp = "Level-Up"
    case mega = "MEGA"
    case pokemonTool = "Pokemon Tool"
    case pokemonToolF = "Pokemon Tool F"
    case rapidStrike = "Rapid Strike"
    case restored = "Restored"
    case rocketsSecretMachine = "Rocket's Secret Machine"
    case singleStrike = "Single Strike"
    case special = "Special"
    case stadium = "Stadium"
    case stageOne = "Stage 1"
    case StageTwo = "Stage 2"
    case supporter = "Supporter"
    case tagTeam = "TAG TEAM"
    case technicalMachine = "Technical Machine"
    case v = "V"
    case vmax = "VMAX"
}

// Tcgplayer.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tcgplayer = try? newJSONDecoder().decode(Tcgplayer.self, from: jsonData)

import Foundation

// MARK: - Tcgplayer
struct Tcgplayer: Codable {
    let url: String?
    let updatedAt: String?
    let prices: Prices?
}

// Prices.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let prices = try? newJSONDecoder().decode(Prices.self, from: jsonData)

import Foundation

// MARK: - Prices
struct Prices: Codable {
    let holofoil: Holofoil?
}

// Holofoil.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let holofoil = try? newJSONDecoder().decode(Holofoil.self, from: jsonData)

import Foundation

// MARK: - Holofoil
struct Holofoil: Codable {
    let low, mid, high, market: Double?
    let directLow: Double?
}

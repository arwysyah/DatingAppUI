//
//  TurnCards.swift
//  DatingAppUI
//
//  Created by Arwy Syahputra Siregar on 25/09/25.
//

import Foundation

struct TurnCard: Identifiable, Codable {
    let id: String
    let name: String
    let age: Int
    let question: String
    let image: String
    let showBadge: Bool
    let status: String?
    let isBlurred: Bool
}


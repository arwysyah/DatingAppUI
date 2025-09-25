//
//  Chat.swift
//  DatingAppUI
//
//  Created by Arwy Syahputra Siregar on 25/09/25.
//

import Foundation
//struct Chat: Identifiable {
//    let id = UUID()
//    let name: String
//    let message: String
//    let time: String
//    let imageName: String
//    let isNewChat: Bool
//    let isYourMove: Bool
//    let hasVoiceNote: Bool
//    let unreadCount: Int
//    let hasRead: Bool
//    let isFavorite: Bool
//}

struct Chat: Identifiable, Codable {
    var id : String
    let name: String
    let message: String
    let time: String
    let imageName: String
    let isNewChat: Bool
    let isYourMove: Bool
    let hasVoiceNote: Bool
    let unreadCount: Int
    let hasRead: Bool
    let isFavorite: Bool
}

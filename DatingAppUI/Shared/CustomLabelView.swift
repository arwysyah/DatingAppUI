//
//  CustomLabelView.swift
//  DatingAppUI
//
//  Created by Arwy Syahputra Siregar on 25/09/25.
//

import SwiftUI

struct CustomLabelView: View {
    let systemImage: String
    let text: String
    let color: Color
    let iconSize: CGFloat
    
    init(systemImage: String = "circle.fill",
         text: String,
         color: Color,
         iconSize: CGFloat = 6) {
        self.systemImage = systemImage
        self.text = text
        self.color = color
        self.iconSize = iconSize
    }
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: systemImage)
                .font(.system(size: iconSize))
                .foregroundColor(color)
            
            Text(text)
                .font(.caption2.bold())
                .foregroundColor(color)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(Color(hex:"#42406F").opacity(0.8))
        .cornerRadius(6)
    }
}

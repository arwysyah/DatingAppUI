//
//  TurnCardView.swift
//  DatingAppUI
//
//  Created by Arwy Syahputra Siregar on 25/09/25.
//

import SwiftUI

struct AnyShape: Shape, Sendable {
    private let _path: @Sendable (CGRect) -> Path
    
    init<S: Shape>(_ wrapped: S) {
        _path = { rect in wrapped.path(in: rect) }
    }
    
    func path(in rect: CGRect) -> Path {
        _path(rect)
    }
}

struct BadgeView: View {
    let icon: String
    let text: String?
    
    private var hasText: Bool { (text?.isEmpty == false) }
    
    private var shape: AnyShape {
        if hasText { AnyShape(Capsule()) }
        else { AnyShape(Circle()) }
    }
    
    var body: some View {
        HStack(spacing: hasText ? 6 : 0) {
            Text(icon)
                .font(.system(size: 10))
            if hasText {
                Text(text!)
                    .font(.system(size: 9, weight: .semibold))
                    .lineLimit(1)
                    .fixedSize()
                    .frame(alignment: .leading) 
            }
        }
        .padding(.horizontal, hasText ? 8 : 6)
        .padding(.vertical, 4)
        .background(Color.black.opacity(0.85))
        .clipShape(shape)
        .animation(.spring(response: 0.28, dampingFraction: 0.7), value: hasText)
    }
}

struct TurnCardView: View {
    let name: String
    let age: Int
    let question: String
    let image: String
    let showBadge: Bool
    let status: String?
    let isBlurred:Bool
    
    init(
        name: String,
        age: Int,
        question: String,
        image: String,
        showBadge: Bool,
        status: String? = nil,
        isBlurred:Bool
    ) {
        self.name = name
        self.age = age
        self.question = question
        self.image = image
        self.showBadge = showBadge
        self.status = status
        self.isBlurred = isBlurred
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 145, height: 205)
                .clipped()
                .if(isBlurred) { $0.blur(radius: 20) }
                .overlay(Color.black.opacity(0.70))
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: .black.opacity(0.35), radius: 6, x: 3, y: 4)

          
            if showBadge {
                BadgeView(icon: "📣", text: status)
                    .padding(.top, 8)
                    .padding(.leading, 8)
            }

    
            Text("Tap to answer")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Color(hex: "#A8AFB7"))
                .frame(width: 145, height: 205)
                .multilineTextAlignment(.center)

            VStack(spacing: 4) {
                Text("\(name), \(age)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)

                Text(question)
                    .font(.system(size: 10))
                    .foregroundColor(AppColors.shineLavender)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding(.horizontal, 8)
            }
            .frame(width: 145)
            .padding(.bottom, 12)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(width: 145, height: 205)

    }
}


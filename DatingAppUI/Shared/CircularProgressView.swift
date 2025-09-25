//
//  CircularProgressView.swift
//  DatingAppUI
//
//  Created by Arwy Syahputra Siregar on 25/09/25.
//


import SwiftUI

struct CircularProgressView: View {
    var progress: Double
    var imageName: String

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 8)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [.green, .purple]),
                        center: .center
                    ),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))

            Image(imageName)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .padding(10)
        }
        .frame(width: 120, height: 120)
    }
}


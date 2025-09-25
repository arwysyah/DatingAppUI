//
//  ScoreBadge.swift
//  DatingAppUI
//
//  Created by Arwy Syahputra Siregar on 25/09/25.
//

import SwiftUI

struct ScoreBadge: View {


    var body: some View {
        ZStack {
            Color(hex: "#12161F")
                .frame(width: 42, height: 18)
                .clipShape(Capsule())
                .shadow(
                    color: Color.black.opacity(0.25),
                    radius: 3.6,
                    x: 0,
                    y: 3.6
                )

            Text("90")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
    }
}

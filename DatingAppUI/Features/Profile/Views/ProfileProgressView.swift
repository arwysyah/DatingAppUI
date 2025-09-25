//
//  ProfileProgressView.swift
//  DatingAppUI
//
//  Created by Arwy Syahputra Siregar on 25/09/25.
//
import SwiftUI

struct ProfileProgressView: View {
    var progress: Double = 0.65

    
    var body: some View {
        ZStack {
            VStack {
                ZStack {

                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(colors: [
                                    Color.green.opacity(0.8),
                                    Color.black.opacity(0.2)
                                ]),
                                center: .center
                            ),
                            style: StrokeStyle(lineWidth: 8, lineCap: .round)
                        )
                        .rotationEffect(.degrees(140))
                        .frame(width: 44, height: 44)
                    
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 37, height: 37)
                        .clipShape(Circle())
                    
       
                    Capsule()
                        .fill(Color(hex:"#B5B2FF"))
                        .frame(width: 2, height: 12)
                        .offset(y: -22).offset(x:10)
                        .rotationEffect(.degrees(90))
                
                }
                
                ScoreBadge()
                    .offset(y: -10)
            }
        }
    }
}

//#Preview {
//    ProfileProgressView(progress: 0.65)
//        .preferredColorScheme(.dark)
//        .padding()
//        .previewLayout(.sizeThatFits)
//}


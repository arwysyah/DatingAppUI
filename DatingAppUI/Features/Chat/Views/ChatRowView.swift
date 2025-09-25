//
//  ChatRowView.swift
//  DatingAppUI
//
//  Created by Arwy Syahputra Siregar on 25/09/25.
//


import SwiftUI
struct ChatRowView: View {
    let chat: Chat
    
    var body: some View {
        HStack(spacing: 12) {

            Image(chat.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 54, height: 54)
                .clipShape(Circle())
            
          
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(chat.name)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    
                    if chat.isNewChat {
                        CustomLabelView(text: "New Chat", color: .white)
                    }
                    
                    if chat.isYourMove {
                        LabelView(text: "Your move", color: .white)
                    }
                }
                
                if chat.hasVoiceNote {
                    HStack {
                        Image(systemName: "mic.fill")
                            .foregroundColor(Color(hex: "#8669A8"))
                        Image("soundwave")
                            .resizable()
                            .frame(width: 18, height: 18)
                        
                        Text("00:58")
                            .font(.system(size: 14))
                            .foregroundColor(AppColors.thick_purple)
                            .bold()
                        Spacer()
                    }
                } else {
                    Text(chat.message)
                        .font(.system(size: 14))
                        .foregroundColor(chat.hasRead ? AppColors.smokeGray :Color.white)
                        .lineLimit(2)
                }
            }
            .frame(height: 69)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.white.opacity(0.2)),
                alignment: .bottom
            )
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(chat.time)
                    .font(.caption2)
                    .foregroundColor(chat.time == "Wed" ? .white : AppColors.thin_purple)
                    .fontWeight(.semibold)

                if chat.unreadCount > 0 {
                    Text("\(chat.unreadCount)")
                        .font(.caption2.bold())
                        .foregroundColor(.black)
                        .frame(width: 20, height: 16)
                        .background(AppColors.normal_purple)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
                if chat.isFavorite {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .padding(4)
                        .frame(width: 20, height: 16)
                        .background(AppColors.normal_purple)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }


            }
        }
    
    }
}


private struct LabelView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.caption2.bold())
            .foregroundColor(color)
            .padding(4)
            .background(color.opacity(0.2))
            .cornerRadius(8)
    }
}

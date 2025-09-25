//
//  ContentView.swift
//  DatingAppUI
//
//  Created by Arwy Syahputra Siregar on 24/09/25.
//

import SwiftUI




struct ContentView: View {
    
    let turnCards: [TurnCard] = Bundle.main.decode("turncards.json") ?? []
     
    let chats: [Chat] = Bundle.main.decode("chats.json") ?? []
    
    var body: some View {
        VStack {
            headerSection
            turnCardsSection
            chatSection
            Spacer()
            tabBar
        }
        .background(Color.black.ignoresSafeArea())
        .preferredColorScheme(.dark)
    }
}




extension ContentView {
    
    private var headerSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
         
                HStack {
                    Text("Your Turn")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    ZStack{
                        Circle()
                     .fill(AppColors.lavender)
                     .frame(width: 16, height: 16)
                        Text("7")
                            .foregroundColor(.black)
                            .font(.system(size: 12.0))
                    }
                       }
                HStack {
                    Text("Make your move, they are waiting")
                        .font(.caption)
                        .foregroundColor(AppColors.smokeGray).italic().font(.system(size: 12))
                    Text("🎵")
                        .font(.system(size: 12))

                }
            }
            Spacer()
            .foregroundColor(.white)
                
                ProfileProgressView()
            
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
    
    private var turnCardsSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(turnCards) { card in
                    TurnCardView(
                        name: card.name,
                        age: card.age,
                        question: card.question,
                        image: card.image,
                        showBadge: card.showBadge,
                        status: card.status,
                        isBlurred: card.isBlurred
                    )
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.top, 12)
        .padding(.bottom, 12) 
    }

    
    private var chatSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text("Chats")
                    .font(.headline.bold())
                    .foregroundColor(.white).padding(.bottom,4)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.white),
                        alignment: .bottom
                    )
                
                Text("Pending")
                    .font(.headline.bold())
                    .foregroundColor(.gray) .padding(.leading, 8) 
            }
            Text("The ice is broken. Time to hit it off")
                .font(.caption)
                .foregroundColor(AppColors.smokeGray).italic()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(chats) { chat in
                        ChatRowView(chat: chat)
                    }
                }
               
            }
        }
        .padding(.horizontal)
       
    }
    
    private var tabBar: some View {
        HStack {
            TabBarItem(title: "Cards", imageName: "cards", isSelected: false,badgeCount: 10)
            Spacer()
            TabBarItem(title: "Bonfire", imageName: "bonfire", isSelected: false)
            Spacer()
            TabBarItem(title: "Matches", imageName: "chat", isSelected: true)
            Spacer()
            TabBarItem(title: "Profile", imageName: "marie", isSelected: false)
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 12)
        .background(AppColors.midnight)
    }
}






#Preview {
    ContentView()
}

//
//  TabBarViews.swift
//  DatingAppUI
//
//  Created by Arwy Syahputra Siregar on 25/09/25.
//

import SwiftUI

struct TabBarItem: View {
    let title: String
    let imageName: String
    let isSelected: Bool
    var badgeCount: Int = 0

    var body: some View {
        VStack(spacing: 4) {
            ZStack(alignment: .topTrailing) {
                Image(imageName)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(isSelected ? AppColors.normal_purple : AppColors.smokeGray)

                if badgeCount > 0 {
                    Text("\(badgeCount)")
                        .font(.system(size: 7, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.horizontal, 2) 
                        .padding(.vertical,1)
                    
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(AppColors.normal_purple)
                        )
                }

            }

            Text(title)
                .font(.caption)
                .foregroundColor(isSelected ? AppColors.normal_purple : AppColors.smokeGray)
        }
    }
}

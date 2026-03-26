//
//  HeaderCustomView.swift
//  HealthcareMedicineApp
//
//  Created by Minh Anh on 24/3/26.
//
import SwiftUI

struct HeaderCustomView: View {
    var onBackTapped: (() -> Void)?
    
    var body: some View {
        HStack(spacing: LightAppTheme.Spacing.spacingMedium) {
            Button(action: {
                onBackTapped?()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: LightAppTheme.Sizes.iconSmall, weight: .semibold))
                    .foregroundStyle(LightAppTheme.Colors.textPrimary)
            }
            
            Spacer()
            
            ContentHeaderCustomView()
            
            Spacer()
        }
    }
}

struct ContentHeaderCustomView: View {
    var body: some View {
        HStack(spacing: LightAppTheme.Spacing.spacingSmall) {
            RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusSmall)
                .fill(LightAppTheme.Colors.primary)
                .frame(width: 24, height: 24)
                .overlay {
                    Image(systemName: "shield.fill")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color.white)
                }
            
            Text("MediGuard")
                .font(LightAppTheme.Fonts.titleSmall)
                .foregroundStyle(LightAppTheme.Colors.textPrimary)
        }
    }
}

#Preview {
    HeaderCustomView()
}

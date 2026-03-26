//
//  SocialButtonsCustom.swift
//  HealthcareMedicineApp
//
//  Created by Minh Anh on 24/3/26.
//

import SwiftUI

struct SocialButtonsCustom: View {
    @Bindable var viewModel: LoginViewModel
    
    var body: some View {
        VStack(spacing: LightAppTheme.Spacing.spacingSmall) {
            socialButton(
                title: "Continue with Google",
                textColor: LightAppTheme.Colors.textPrimary,
                background: .white,
                borderColor: LightAppTheme.Colors.border,
                showBorder: true,
                action: viewModel.signInWithGoogleTapped,
                icon: {
                    Text("G")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color(red: 0.25, green: 0.49, blue: 0.96))
                        .frame(width: 24, height: 24)
                        .overlay {
                            Circle()
                                .stroke(LightAppTheme.Colors.borderLight, lineWidth: 1)
                        }
                }
            )

            socialButton(
                title: "Continue with Apple",
                textColor: .white,
                background: LightAppTheme.Colors.primaryDark,
                borderColor: .clear,
                showBorder: false,
                action: viewModel.signInWithAppleTapped,
                icon: {
                    Image(systemName: "applelogo")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width: 24, height: 24)
                }
            )
        }
    }
    
    @ViewBuilder
    func socialButton<Icon: View>(
        title: String,
        textColor: Color,
        background: Color,
        borderColor: Color,
        showBorder: Bool,
        action: @escaping () -> Void,
        @ViewBuilder icon: () -> Icon
    ) -> some View {
        Button(action: action) {
            HStack(spacing: LightAppTheme.Spacing.spacingSmall) {
                icon()
                
                Text(title)
                    .font(LightAppTheme.Fonts.buttonMedium)
                
                Spacer()
            }
            .foregroundStyle(textColor)
            .padding(.horizontal, LightAppTheme.Spacing.spacingSmall)
            .frame(height: LightAppTheme.Sizes.buttonHeightMedium)
            .background(
                RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
                    .fill(background)
            )
            .overlay {
                if showBorder {
                    RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
                        .stroke(borderColor, lineWidth: 1)
                }
            }
        }
        .disabled(viewModel.isLoading)
    }
}


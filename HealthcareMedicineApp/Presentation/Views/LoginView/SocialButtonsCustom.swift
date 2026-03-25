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
        VStack(spacing: 12) {
            socialButton(
                title: "Continue with Google",
                textColor: Color(red: 0.34, green: 0.40, blue: 0.49),
                background: .white,
                borderColor: Color(red: 0.86, green: 0.88, blue: 0.91),
                showBorder: true,
                action: viewModel.signInWithGoogleTapped,
                icon: {
                    Text("G")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color(red: 0.25, green: 0.49, blue: 0.96))
                        .frame(width: 24, height: 24)
                        .overlay {
                            Circle()
                                .stroke(Color(red: 0.88, green: 0.90, blue: 0.93), lineWidth: 1)
                        }
                }
            )

            socialButton(
                title: "Continue with Apple",
                textColor: .white,
                background: Color(red: 0.04, green: 0.11, blue: 0.24),
                borderColor: .clear,
                showBorder: false,
                action: viewModel.signInWithAppleTapped,
                icon: {
                    Image(systemName: "applelogo")
                        .font(.system(size: 20, weight: .semibold))
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
            HStack(spacing: 12) {
                icon()
                
                Text(title)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                
                Spacer()
            }
            .foregroundStyle(textColor)
            .padding(.horizontal, 18)
            .frame(height: 60)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(background)
            )
            .overlay {
                if showBorder {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(borderColor, lineWidth: 1)
                }
            }
        }
        .disabled(viewModel.isLoading)
    }
}


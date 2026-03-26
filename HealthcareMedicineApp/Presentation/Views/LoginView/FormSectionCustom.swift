//
//  FormSectionCustom.swift
//  HealthcareMedicineApp
//
//  Created by Minh Anh on 24/3/26.
//

import SwiftUI

struct FormSectionCustom: View {
    @Binding var viewModel: LoginViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: LightAppTheme.Spacing.spacingMedium) {
            VStack(alignment: .leading, spacing: LightAppTheme.Spacing.spacingXS) {
                Text("Email Address")
                    .font(LightAppTheme.Fonts.headingSmall)
                    .foregroundStyle(LightAppTheme.Colors.textPrimary)

                HStack(spacing: LightAppTheme.Spacing.spacingSmall) {
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(LightAppTheme.Colors.textSecondary)

                    TextField("name@example.com", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .font(LightAppTheme.Fonts.bodyMedium)
                }
                .padding(.horizontal, LightAppTheme.Spacing.spacingSmall)
                .frame(height: LightAppTheme.Sizes.inputFieldHeight)
                .background(
                    RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
                        .fill(LightAppTheme.Colors.cardBackground)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
                        .stroke(LightAppTheme.Colors.border, lineWidth: 1)
                }
            }

            VStack(alignment: .leading, spacing: LightAppTheme.Spacing.spacingXS) {
                Text("Password")
                    .font(LightAppTheme.Fonts.headingSmall)
                    .foregroundStyle(LightAppTheme.Colors.textPrimary)

                HStack(spacing: LightAppTheme.Spacing.spacingSmall) {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(LightAppTheme.Colors.textSecondary)

                    SecureField("Enter your password", text: $viewModel.password)
                        .font(LightAppTheme.Fonts.bodyMedium)

                    Spacer()

                    Image(systemName: "eye")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(LightAppTheme.Colors.textSecondary)
                }
                .padding(.horizontal, LightAppTheme.Spacing.spacingSmall)
                .frame(height: LightAppTheme.Sizes.inputFieldHeight)
                .background(
                    RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
                        .fill(LightAppTheme.Colors.cardBackground)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
                        .stroke(LightAppTheme.Colors.border, lineWidth: 1)
                }
            }
        }
    }
}

#Preview {
    FormSectionCustom(viewModel: .constant(AppContainer.shared.makeLoginViewModel()))
}

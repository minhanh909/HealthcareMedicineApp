//
//  TitleSectionCustom.swift
//  HealthcareMedicineApp
//
//  Created by Minh Anh on 24/3/26.
//

import SwiftUI

struct TitleSectionCustom: View {
    var body: some View {
        VStack(alignment: .leading, spacing: LightAppTheme.Spacing.spacingXS) {
            Text("Welcome Back")
                .font(LightAppTheme.Fonts.titleLarge)
                .foregroundStyle(LightAppTheme.Colors.textPrimary)

            Text("Securely access your health records\nand provider communications.")
                .font(LightAppTheme.Fonts.bodyMedium)
                .foregroundStyle(LightAppTheme.Colors.textSecondary)
                .lineSpacing(2)
        }
    }
}


//
//  TitleSectionCustom.swift
//  HealthcareMedicineApp
//
//  Created by Minh Anh on 24/3/26.
//

import SwiftUI

struct TitleSectionCustom: View {
    private let darkColor = Color(red: 0.02, green: 0.12, blue: 0.22)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Welcome Back")
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(darkColor)

            Text("Securely access your health records\nand provider communications.")
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(Color.gray)
                .lineSpacing(2)
        }
    }
}


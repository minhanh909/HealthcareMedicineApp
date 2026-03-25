//
//  TitleSectionCustom.swift
//  HealthcareMedicineApp
//
//  Created by Minh Anh on 24/3/26.
//

import SwiftUI

struct TitleSectionCustom: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Welcome Back")
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundStyle(Color(red: 0.09, green: 0.12, blue: 0.20))

            Text("Securely access your health records\nand provider communications.")
                .font(.system(size: 21, weight: .medium))
                .foregroundStyle(Color(red: 0.44, green: 0.52, blue: 0.63))
                .lineSpacing(2)
        }
    }
}


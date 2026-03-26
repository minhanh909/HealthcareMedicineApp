//
//  FormSectionCustom.swift
//  HealthcareMedicineApp
//
//  Created by Minh Anh on 24/3/26.
//

import SwiftUI

struct FormSectionCustom: View {
    @Binding var viewModel: LoginViewModel
    
    private let darkColor = Color(red: 0.02, green: 0.12, blue: 0.22)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Email Address")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(darkColor)

                HStack(spacing: 12) {
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.gray)

                    TextField("name@example.com", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .font(.system(size: 16, weight: .regular))
                }
                .padding(.horizontal, 14)
                .frame(height: 56)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.white.opacity(0.72))
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color(red: 0.86, green: 0.88, blue: 0.91), lineWidth: 1)
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Password")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(darkColor)

                HStack(spacing: 12) {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.gray)

                    SecureField("Enter your password", text: $viewModel.password)
                        .font(.system(size: 16, weight: .regular))

                    Spacer()

                    Image(systemName: "eye")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color.gray)
                }
                .padding(.horizontal, 14)
                .frame(height: 56)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.white.opacity(0.72))
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color(red: 0.86, green: 0.88, blue: 0.91), lineWidth: 1)
                }
            }
        }
    }
}

#Preview {
    FormSectionCustom(viewModel: .constant(AppContainer.shared.makeLoginViewModel()))
}

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
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Email Address")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(Color(red: 0.24, green: 0.30, blue: 0.40))

                HStack(spacing: 12) {
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(red: 0.68, green: 0.72, blue: 0.79))

                    TextField("name@example.com", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .font(.system(size: 22, weight: .medium))
                }
                .padding(.horizontal, 14)
                .frame(height: 64)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color.white.opacity(0.72))
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(Color(red: 0.86, green: 0.88, blue: 0.91), lineWidth: 1)
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Password")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(Color(red: 0.24, green: 0.30, blue: 0.40))

                HStack(spacing: 12) {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(red: 0.68, green: 0.72, blue: 0.79))

                    SecureField("Enter your password", text: $viewModel.password)
                        .font(.system(size: 22, weight: .medium))

                    Spacer()

                    Image(systemName: "eye")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(Color(red: 0.62, green: 0.67, blue: 0.74))
                }
                .padding(.horizontal, 14)
                .frame(height: 64)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color.white.opacity(0.72))
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(Color(red: 0.86, green: 0.88, blue: 0.91), lineWidth: 1)
                }
            }
        }
    }
}

#Preview {
    FormSectionCustom(viewModel: .constant(AppContainer.shared.makeLoginViewModel()))
}

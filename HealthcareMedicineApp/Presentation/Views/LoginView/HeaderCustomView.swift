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
        HStack(spacing: 16) {
            Button(action: {
                onBackTapped?()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color(red: 0.11, green: 0.15, blue: 0.24))
            }
            
            Spacer()
            
            ContentHeaderCustomView()
            
            Spacer()
        }
    }
}

struct ContentHeaderCustomView: View {
    var body: some View {
        HStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(red: 0.13, green: 0.85, blue: 0.77))
                .frame(width: 24, height: 24)
                .overlay {
                    Image(systemName: "shield.fill")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color(red: 0.05, green: 0.18, blue: 0.28))
                }
            
            Text("MediGuard")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundStyle(Color(red: 0.12, green: 0.16, blue: 0.25))
        }
    }
}

#Preview {
    HeaderCustomView()
}

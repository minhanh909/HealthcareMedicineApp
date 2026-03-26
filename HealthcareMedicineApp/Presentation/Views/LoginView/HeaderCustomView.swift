//
//  HeaderCustomView.swift
//  HealthcareMedicineApp
//
//  Created by Minh Anh on 24/3/26.
//
import SwiftUI

struct HeaderCustomView: View {
    var onBackTapped: (() -> Void)?
    
    private let tealColor = Color(red: 0.13, green: 0.85, blue: 0.77)
    private let darkColor = Color(red: 0.02, green: 0.12, blue: 0.22)
    
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                onBackTapped?()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(darkColor)
            }
            
            Spacer()
            
            ContentHeaderCustomView()
            
            Spacer()
        }
    }
}

struct ContentHeaderCustomView: View {
    private let tealColor = Color(red: 0.13, green: 0.85, blue: 0.77)
    private let darkColor = Color(red: 0.02, green: 0.12, blue: 0.22)
    
    var body: some View {
        HStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(tealColor)
                .frame(width: 24, height: 24)
                .overlay {
                    Image(systemName: "shield.fill")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color.white)
                }
            
            Text("MediGuard")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(darkColor)
        }
    }
}

#Preview {
    HeaderCustomView()
}

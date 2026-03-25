import SwiftUI

struct Welcome2View: View {
    @State private var selectedDate = Date()
    var onBackTapped: (() -> Void)?
    var onNextTapped: (() -> Void)?
    
    private let tealColor = Color(red: 0.13, green: 0.85, blue: 0.77)
    private let darkColor = Color(red: 0.02, green: 0.12, blue: 0.22)
    private let lightTeal = Color(red: 0.72, green: 0.91, blue: 0.88)
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            HStack {
                Text("MediGuard")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(darkColor)
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            
            Spacer()
            
            // Illustration - Calendar/Date
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(lightTeal)
                        .frame(height: 180)
                    
                    VStack(spacing: 12) {
                        HStack {
                            Text("2")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundStyle(tealColor)
                            Spacer()
                            Image(systemName: "calendar")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundStyle(tealColor)
                        }
                        
                        HStack {
                            Text("Days remaining")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundStyle(Color.gray)
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .padding(20)
                }
            }
            .padding(.horizontal, 24)
            .frame(height: 200)
            
            Spacer()
            
            // Content
            VStack(spacing: 16) {
                Text("Track Expiry Dates")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(darkColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Never miss medicine expiry dates with timely notifications before they expire")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .lineLimit(3)
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            // Navigation buttons
            HStack(spacing: 16) {
                Button(action: {
                    onBackTapped?()
                }) {
                    Text("Back")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(tealColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(tealColor, lineWidth: 2)
                        )
                }
                
                Button(action: {
                    onNextTapped?()
                }) {
                    HStack(spacing: 8) {
                        Text("Next")
                            .font(.system(size: 16, weight: .semibold))
                        Image(systemName: "arrow.right")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundStyle(darkColor)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(tealColor)
                    )
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
    }
}

#Preview {
    Welcome2View()
}

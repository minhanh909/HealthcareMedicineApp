import SwiftUI

struct Welcome1View: View {
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
            
            // Illustration - Doctor with checkmark
            VStack {
                ZStack {
                    Circle()
                        .fill(lightTeal)
                        .frame(width: 200, height: 200)
                    
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 120))
                        .foregroundStyle(tealColor)
                }
                .frame(height: 240)
            }
            
            Spacer()
            
            // Content
            VStack(spacing: 16) {
                Text("Welcome to MediGuard")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(darkColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Your personal assistant for medicine safety and professional management")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .lineLimit(3)
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            // Next button
            Button(action: {
                onNextTapped?()
            }) {
                HStack(spacing: 10) {
                    Text("Next")
                        .font(.system(size: 18, weight: .semibold))
                    Image(systemName: "arrow.right")
                        .font(.system(size: 16, weight: .semibold))
                }
                .foregroundStyle(darkColor)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(tealColor)
                )
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
    }
}

#Preview {
    Welcome1View()
}

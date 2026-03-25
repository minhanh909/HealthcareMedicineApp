import SwiftUI

struct Welcome3View: View {
    var onLoginTapped: (() -> Void)?
    var onCreateAccountTapped: (() -> Void)?
    
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
            
            // Illustration - Shield
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(lightTeal)
                        .frame(height: 180)
                    
                    Image(systemName: "shield.fill")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundStyle(tealColor)
                }
            }
            .padding(.horizontal, 24)
            .frame(height: 200)
            
            Spacer()
            
            // Content
            VStack(spacing: 16) {
                Text("Get Started")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(darkColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Join thousands of users taking control of their medication safety today")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .lineLimit(3)
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            // Buttons
            VStack(spacing: 12) {
                Button(action: {
                    onCreateAccountTapped?()
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 18, weight: .semibold))
                        Text("Create Account")
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
                
                Button(action: {
                    onLoginTapped?()
                }) {
                    Text("Login")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(tealColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(tealColor, lineWidth: 2)
                        )
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
    }
}

#Preview {
    Welcome3View()
}

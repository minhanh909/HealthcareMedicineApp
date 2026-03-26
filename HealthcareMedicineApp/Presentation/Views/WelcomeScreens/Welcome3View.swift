import SwiftUI

struct Welcome3View: View {
    var onLoginTapped: (() -> Void)?
    var onCreateAccountTapped: (() -> Void)?

    var body: some View {
        VStack(spacing: LightAppTheme.Spacing.spacingLarge) {
            // Header
            HStack {
                Text("MediGuard")
                    .font(LightAppTheme.Fonts.titleSmall)
                    .foregroundStyle(LightAppTheme.Colors.textPrimary)
                Spacer()
            }
            .padding(.horizontal, LightAppTheme.Spacing.spacingXL)
            .padding(.top, LightAppTheme.Spacing.spacingMedium)
            
            Spacer()
            
            // Illustration - Shield
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusLarge, style: .continuous)
                        .fill(LightAppTheme.Colors.primaryLight)
                        .frame(height: 180)
                    
                    Image(systemName: "shield.fill")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundStyle(LightAppTheme.Colors.primary)
                }
            }
            .padding(.horizontal, LightAppTheme.Spacing.spacingXL)
            .frame(height: 200)
            
            Spacer()
            
            // Content
            VStack(spacing: LightAppTheme.Spacing.spacingMedium) {
                Text("Get Started")
                    .font(LightAppTheme.Fonts.titleLarge)
                    .foregroundStyle(LightAppTheme.Colors.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Join thousands of users taking control of their medication safety today")
                    .font(LightAppTheme.Fonts.bodyMedium)
                    .foregroundStyle(LightAppTheme.Colors.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .lineLimit(3)
            }
            .padding(.horizontal, LightAppTheme.Spacing.spacingXL)
            
            Spacer()
            
            // Buttons
            VStack(spacing: LightAppTheme.Spacing.spacingSmall) {
                Button(action: {
                    onCreateAccountTapped?()
                }) {
                    HStack(spacing: LightAppTheme.Spacing.spacingXS) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: LightAppTheme.Sizes.iconSmall, weight: .semibold))
                        Text("Create Account")
                            .font(LightAppTheme.Fonts.buttonMedium)
                    }
                    .frame(maxWidth: .infinity)
                    .primaryButtonStyle()
                }
                
                Button(action: {
                    onLoginTapped?()
                }) {
                    Text("Login")
                        .font(LightAppTheme.Fonts.buttonMedium)
                        .frame(maxWidth: .infinity)
                        .secondaryButtonStyle()
                }
            }
            .padding(.horizontal, LightAppTheme.Spacing.spacingXL)
            .padding(.bottom, LightAppTheme.Spacing.spacingXL)
        }
    }
}

#Preview {
    Welcome3View()
}


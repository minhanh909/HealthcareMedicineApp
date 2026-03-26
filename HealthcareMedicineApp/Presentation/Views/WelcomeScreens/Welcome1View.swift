import SwiftUI

struct Welcome1View: View {
    var onNextTapped: (() -> Void)?

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
            
            // Illustration - Doctor with checkmark
            VStack {
                ZStack {
                    Circle()
                        .fill(LightAppTheme.Colors.primaryLight)
                        .frame(width: 200, height: 200)
                    
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 120))
                        .foregroundStyle(LightAppTheme.Colors.primary)
                }
                .frame(height: 240)
            }
            
            Spacer()
            
            // Content
            VStack(spacing: LightAppTheme.Spacing.spacingMedium) {
                Text("Welcome to MediGuard")
                    .font(LightAppTheme.Fonts.titleLarge)
                    .foregroundStyle(LightAppTheme.Colors.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Your personal assistant for medicine safety and professional management")
                    .font(LightAppTheme.Fonts.bodyMedium)
                    .foregroundStyle(LightAppTheme.Colors.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .lineLimit(3)
            }
            .padding(.horizontal, LightAppTheme.Spacing.spacingXL)
            
            Spacer()
            
            // Next button
            Button(action: {
                onNextTapped?()
            }) {
                HStack(spacing: LightAppTheme.Spacing.spacingSmall) {
                    Text("Next")
                        .font(LightAppTheme.Fonts.buttonLarge)
                    Image(systemName: "arrow.right")
                        .font(.system(size: 16, weight: .semibold))
                }
                .frame(maxWidth: .infinity)
                .primaryButtonStyle()
            }
            .padding(.horizontal, LightAppTheme.Spacing.spacingXL)
            .padding(.bottom, LightAppTheme.Spacing.spacingXL)
        }
    }
}

#Preview {
    Welcome1View()
}

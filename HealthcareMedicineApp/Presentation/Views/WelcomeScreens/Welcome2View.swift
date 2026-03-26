import SwiftUI

struct Welcome2View: View {
    @State private var selectedDate = Date()
    var onBackTapped: (() -> Void)?
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
            
            // Illustration - Calendar/Date
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusLarge, style: .continuous)
                        .fill(LightAppTheme.Colors.primaryLight)
                        .frame(height: 180)
                    
                    VStack(spacing: LightAppTheme.Spacing.spacingSmall) {
                        HStack {
                            Text("2")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundStyle(LightAppTheme.Colors.primary)
                            Spacer()
                            Image(systemName: "calendar")
                                .font(.system(size: LightAppTheme.Sizes.iconMedium, weight: .semibold))
                                .foregroundStyle(LightAppTheme.Colors.primary)
                        }
                        
                        HStack {
                            Text("Days remaining")
                                .font(LightAppTheme.Fonts.captionLarge)
                                .foregroundStyle(LightAppTheme.Colors.textSecondary)
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .padding(LightAppTheme.Spacing.spacingXL)
                }
            }
            .padding(.horizontal, LightAppTheme.Spacing.spacingXL)
            .frame(height: 200)
            
            Spacer()
            
            // Content
            VStack(spacing: LightAppTheme.Spacing.spacingMedium) {
                Text("Track Expiry Dates")
                    .font(LightAppTheme.Fonts.titleLarge)
                    .foregroundStyle(LightAppTheme.Colors.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Never miss medicine expiry dates with timely notifications before they expire")
                    .font(LightAppTheme.Fonts.bodyMedium)
                    .foregroundStyle(LightAppTheme.Colors.textSecondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .lineLimit(3)
            }
            .padding(.horizontal, LightAppTheme.Spacing.spacingXL)
            
            Spacer()
            
            // Navigation buttons
            HStack(spacing: LightAppTheme.Spacing.spacingMedium) {
                Button(action: {
                    onBackTapped?()
                }) {
                    Text("Back")
                        .secondaryButtonStyle()
                }
                
                Button(action: {
                    onNextTapped?()
                }) {
                    HStack(spacing: LightAppTheme.Spacing.spacingXS) {
                        Text("Next")
                            .font(LightAppTheme.Fonts.buttonLarge)
                        Image(systemName: "arrow.right")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .frame(maxWidth: .infinity)
                    .primaryButtonStyle()
                }
            }
            .padding(.horizontal, LightAppTheme.Spacing.spacingXL)
            .padding(.bottom, LightAppTheme.Spacing.spacingXL)
        }
    }
}

#Preview {
    Welcome2View()
}

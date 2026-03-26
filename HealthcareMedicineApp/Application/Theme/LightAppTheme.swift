import SwiftUI

/// Centralized theme for the entire application
struct LightAppTheme {
    // MARK: - Colors
    struct Colors {
        // Primary Colors
        static let primary = Color(red: 0.13, green: 0.85, blue: 0.77)      // Teal
        static let primaryLight = Color(red: 0.72, green: 0.91, blue: 0.88) // Light Teal
        static let primaryDark = Color(red: 0.02, green: 0.12, blue: 0.22)  // Dark
        
        // Backgrounds
        static let background = Color(red: 0.95, green: 0.96, blue: 0.97)
        static let cardBackground = Color.white.opacity(0.72)
        
        // Text Colors
        static let textPrimary = Color(red: 0.02, green: 0.12, blue: 0.22)
        static let textSecondary = Color.gray
        static let textLight = Color(red: 0.88, green: 0.90, blue: 0.93)
        
        // Borders
        static let border = Color(red: 0.86, green: 0.88, blue: 0.91)
        static let borderLight = Color(red: 0.88, green: 0.90, blue: 0.93)
        
        // Status Colors
        static let success = Color.green
        static let error = Color.red
        static let warning = Color.orange
        static let info = Color.blue
    }
    
    // MARK: - Fonts
    struct Fonts {
        // Title Fonts
        static let titleLarge = Font.system(size: 28, weight: .bold)
        static let titleMedium = Font.system(size: 24, weight: .bold)
        static let titleSmall = Font.system(size: 20, weight: .bold)
        
        // Heading Fonts
        static let headingLarge = Font.system(size: 20, weight: .semibold)
        static let headingMedium = Font.system(size: 18, weight: .semibold)
        static let headingSmall = Font.system(size: 16, weight: .semibold)
        
        // Body Fonts
        static let bodyLarge = Font.system(size: 18, weight: .regular)
        static let bodyMedium = Font.system(size: 16, weight: .regular)
        static let bodySmall = Font.system(size: 14, weight: .regular)
        
        // Button Fonts
        static let buttonLarge = Font.system(size: 18, weight: .semibold)
        static let buttonMedium = Font.system(size: 16, weight: .semibold)
        static let buttonSmall = Font.system(size: 14, weight: .semibold)
        
        // Caption Fonts
        static let captionLarge = Font.system(size: 14, weight: .regular)
        static let captionSmall = Font.system(size: 12, weight: .regular)
    }
    
    // MARK: - Sizes
    struct Sizes {
        // Button Heights
        static let buttonHeightLarge = CGFloat(72)
        static let buttonHeightMedium = CGFloat(56)
        static let buttonHeightSmall = CGFloat(44)
        
        // Corner Radii
        static let cornerRadiusLarge = CGFloat(20)
        static let cornerRadiusMedium = CGFloat(16)
        static let cornerRadiusSmall = CGFloat(8)
        
        // Input field heights
        static let inputFieldHeight = CGFloat(56)
        static let inputFieldSmallHeight = CGFloat(44)
        
        // Icon sizes
        static let iconLarge = CGFloat(36)
        static let iconMedium = CGFloat(24)
        static let iconSmall = CGFloat(16)
    }
    
    // MARK: - Spacing
    struct Spacing {
        static let spacingXXL = CGFloat(32)
        static let spacingXL = CGFloat(24)
        static let spacingLarge = CGFloat(20)
        static let spacingMedium = CGFloat(16)
        static let spacingSmall = CGFloat(12)
        static let spacingXS = CGFloat(8)
        static let spacingXXS = CGFloat(4)
    }
    
    // MARK: - Shadows
    struct Shadows {
        static let shadowSmall = Shadow(
            color: Color.black.opacity(0.1),
            radius: 4,
            x: 0,
            y: 2
        )
        
        static let shadowMedium = Shadow(
            color: Color.black.opacity(0.15),
            radius: 8,
            x: 0,
            y: 4
        )
        
        static let shadowLarge = Shadow(
            color: Color.black.opacity(0.2),
            radius: 12,
            x: 0,
            y: 8
        )
        
        static let shadowPrimary = Shadow(
            color: Color(red: 0.13, green: 0.85, blue: 0.77).opacity(0.35),
            radius: 10,
            x: 0,
            y: 6
        )
    }
}

// MARK: - Shadow Structure
struct Shadow {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
}

// MARK: - View Extensions
extension View {
    func withPrimaryShadow() -> some View {
        self.shadow(
            color: LightAppTheme.Shadows.shadowPrimary.color,
            radius: LightAppTheme.Shadows.shadowPrimary.radius,
            x: LightAppTheme.Shadows.shadowPrimary.x,
            y: LightAppTheme.Shadows.shadowPrimary.y
        )
    }
    
    func withMediumShadow() -> some View {
        self.shadow(
            color: LightAppTheme.Shadows.shadowMedium.color,
            radius: LightAppTheme.Shadows.shadowMedium.radius,
            x: LightAppTheme.Shadows.shadowMedium.x,
            y: LightAppTheme.Shadows.shadowMedium.y
        )
    }
    
    func primaryButtonStyle() -> some View {
        self
            .font(LightAppTheme.Fonts.buttonLarge)
            .foregroundStyle(LightAppTheme.Colors.primaryDark)
            .frame(height: LightAppTheme.Sizes.buttonHeightMedium)
            .background(
                RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
                    .fill(LightAppTheme.Colors.primary)
            )
            .withPrimaryShadow()
    }
    
    func secondaryButtonStyle() -> some View {
        self
            .font(LightAppTheme.Fonts.buttonLarge)
            .foregroundStyle(LightAppTheme.Colors.primary)
            .frame(height: LightAppTheme.Sizes.buttonHeightMedium)
            .background(
                RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
                    .stroke(LightAppTheme.Colors.primary, lineWidth: 2)
            )
    }
}

import SwiftUI

/// Dark theme for the application
struct DarkAppTheme {
    // MARK: - Colors
    struct Colors {
        // Primary Colors (same accent colors)
        static let primary = Color(red: 0.13, green: 0.85, blue: 0.77)      // Teal
        static let primaryLight = Color(red: 0.72, green: 0.91, blue: 0.88) // Light Teal
        static let primaryDark = Color(red: 0.02, green: 0.12, blue: 0.22)  // Dark (used for text)
        
        // Backgrounds - Dark Theme
        static let background = Color(red: 0.08, green: 0.08, blue: 0.10)   // Very dark background
        static let cardBackground = Color(red: 0.12, green: 0.12, blue: 0.15) // Dark card
        static let inputBackground = Color(red: 0.15, green: 0.15, blue: 0.18) // Dark input
        
        // Text Colors - Light for dark backgrounds
        static let textPrimary = Color.white
        static let textSecondary = Color(red: 0.70, green: 0.70, blue: 0.75)
        static let textLight = Color(red: 0.50, green: 0.50, blue: 0.55)
        
        // Borders - Dark Theme
        static let border = Color(red: 0.25, green: 0.25, blue: 0.30)
        static let borderLight = Color(red: 0.20, green: 0.20, blue: 0.25)
        
        // Status Colors
        static let success = Color(red: 0.34, green: 0.80, blue: 0.63)
        static let error = Color(red: 0.95, green: 0.46, blue: 0.46)
        static let warning = Color(red: 1.0, green: 0.67, blue: 0.30)
        static let info = Color(red: 0.46, green: 0.67, blue: 1.0)
    }
    
    // MARK: - Fonts (Same as light theme)
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
    
    // MARK: - Sizes (Same as light theme)
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
    
    // MARK: - Spacing (Same as light theme)
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
            color: Color.black.opacity(0.4),
            radius: 4,
            x: 0,
            y: 2
        )
        
        static let shadowMedium = Shadow(
            color: Color.black.opacity(0.5),
            radius: 8,
            x: 0,
            y: 4
        )
        
        static let shadowLarge = Shadow(
            color: Color.black.opacity(0.6),
            radius: 12,
            x: 0,
            y: 8
        )
        
        static let shadowPrimary = Shadow(
            color: Color(red: 0.13, green: 0.85, blue: 0.77).opacity(0.45),
            radius: 10,
            x: 0,
            y: 6
        )
    }
}

// MARK: - View Extensions for Dark Theme
extension View {
    func withDarkPrimaryShadow() -> some View {
        self.shadow(
            color: DarkAppTheme.Shadows.shadowPrimary.color,
            radius: DarkAppTheme.Shadows.shadowPrimary.radius,
            x: DarkAppTheme.Shadows.shadowPrimary.x,
            y: DarkAppTheme.Shadows.shadowPrimary.y
        )
    }
    
    func withDarkMediumShadow() -> some View {
        self.shadow(
            color: DarkAppTheme.Shadows.shadowMedium.color,
            radius: DarkAppTheme.Shadows.shadowMedium.radius,
            x: DarkAppTheme.Shadows.shadowMedium.x,
            y: DarkAppTheme.Shadows.shadowMedium.y
        )
    }
    
    func darkPrimaryButtonStyle() -> some View {
        self
            .font(DarkAppTheme.Fonts.buttonLarge)
            .foregroundStyle(DarkAppTheme.Colors.primaryDark)
            .frame(height: DarkAppTheme.Sizes.buttonHeightMedium)
            .background(
                RoundedRectangle(cornerRadius: DarkAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
                    .fill(DarkAppTheme.Colors.primary)
            )
            .withDarkPrimaryShadow()
    }
    
    func darkSecondaryButtonStyle() -> some View {
        self
            .font(DarkAppTheme.Fonts.buttonLarge)
            .foregroundStyle(DarkAppTheme.Colors.primary)
            .frame(height: DarkAppTheme.Sizes.buttonHeightMedium)
            .background(
                RoundedRectangle(cornerRadius: DarkAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
                    .stroke(DarkAppTheme.Colors.primary, lineWidth: 2)
            )
    }
}

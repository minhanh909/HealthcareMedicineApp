import SwiftUI

/// Manages theme switching between light and dark themes
@Observable
final class ThemeManager {
    static let shared = ThemeManager()
    
    enum ThemeMode {
        case light
        case dark
    }
    
    @ObservationIgnored
    @AppStorage("selectedTheme") private var storedTheme = "light"
    
    var currentTheme: ThemeMode {
        get {
            storedTheme == "dark" ? .dark : .light
        }
        set {
            storedTheme = newValue == .dark ? "dark" : "light"
        }
    }
    
    private init() {}
    
    /// Toggle between light and dark theme
    func toggleTheme() {
        currentTheme = currentTheme == .light ? .dark : .light
    }
    
    /// Set specific theme
    func setTheme(_ theme: ThemeMode) {
        currentTheme = theme
    }
}

// MARK: - Helper Properties for Easy Access
extension ThemeManager {
    /// Check if currently using dark theme
    var isDarkTheme: Bool {
        currentTheme == .dark
    }
    
    /// Get current primary color
    func getColor(_ lightColor: Color, _ darkColor: Color) -> Color {
        return currentTheme == .dark ? darkColor : lightColor
    }
    
    /// Get primary action color based on theme
    func getPrimaryColor() -> Color {
        return currentTheme == .dark ? DarkAppTheme.Colors.primary : LightAppTheme.Colors.primary
    }
    
    /// Get background color based on theme
    func getBackgroundColor() -> Color {
        return currentTheme == .dark ? DarkAppTheme.Colors.background : LightAppTheme.Colors.background
    }
    
    /// Get text primary color based on theme
    func getTextPrimaryColor() -> Color {
        return currentTheme == .dark ? DarkAppTheme.Colors.textPrimary : LightAppTheme.Colors.textPrimary
    }
    
    /// Get text secondary color based on theme
    func getTextSecondaryColor() -> Color {
        return currentTheme == .dark ? DarkAppTheme.Colors.textSecondary : LightAppTheme.Colors.textSecondary
    }
}


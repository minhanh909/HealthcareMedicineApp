# Theme System Documentation

## Overview

The MediGuard app uses a flexible, centralized theme system supporting both **Light** and **Dark** themes. All styling (colors, fonts, sizes, spacing, shadows) is defined in theme files and can be easily switched at runtime.

## Files Structure

```
Application/Theme/
├── AppTheme.swift           # Light theme definitions
├── DarkAppTheme.swift       # Dark theme definitions
└── ThemeManager.swift       # Theme switching logic
```

## Theme Files

### AppTheme.swift (Light Theme)
Defines the light theme with:
- **Colors**: Bright background, dark text, teal accents
- **Fonts**: Typography system with all font sizes and weights
- **Sizes**: Button heights, corner radii, icon sizes
- **Spacing**: Padding and margin constants
- **Shadows**: Various shadow effects

### DarkAppTheme.swift (Dark Theme)
Defines the dark theme with:
- **Colors**: Very dark background, light text, same teal accents
- **Fonts**: Same typography system as light theme
- **Sizes**: Same sizing as light theme
- **Spacing**: Same spacing as light theme
- **Shadows**: Stronger shadows for dark backgrounds

## Using the Theme System

### In Views (Current Method)

```swift
// Light Theme Colors
Text("Hello")
    .foregroundStyle(AppTheme.Colors.textPrimary)

// Dark Theme Colors
Text("Hello")
    .foregroundStyle(DarkAppTheme.Colors.textPrimary)

// Using Button Styles
Button("Sign In") {}
    .primaryButtonStyle()  // Light theme
    .darkPrimaryButtonStyle()  // Dark theme
```

### Fonts

```swift
// Light Theme
Text("Title")
    .font(AppTheme.Fonts.titleLarge)

// Dark Theme
Text("Title")
    .font(DarkAppTheme.Fonts.titleLarge)
```

### Sizes & Spacing

```swift
// Button heights
.frame(height: AppTheme.Sizes.buttonHeightMedium)
.frame(height: DarkAppTheme.Sizes.buttonHeightMedium)

// Padding
.padding(.horizontal, AppTheme.Spacing.spacingXL)
.padding(.horizontal, DarkAppTheme.Spacing.spacingXL)
```

## Theme Manager (For Future Implementation)

When ready to implement dynamic theme switching:

```swift
@State private var themeManager = ThemeManager.shared

// Toggle theme
Button("Toggle Theme") {
    themeManager.toggleTheme()
}

// Check current theme
if themeManager.currentTheme == .dark {
    // Use dark theme
}

// Set specific theme
themeManager.setTheme(.dark)
```

## Color Reference

### Light Theme (AppTheme)
| Color | Usage |
|-------|-------|
| `Colors.background` | Page background (light gray) |
| `Colors.primary` | Primary action buttons (teal) |
| `Colors.textPrimary` | Main text (dark) |
| `Colors.textSecondary` | Secondary text (gray) |

### Dark Theme (DarkAppTheme)
| Color | Usage |
|-------|-------|
| `Colors.background` | Page background (very dark) |
| `Colors.primary` | Primary action buttons (teal) |
| `Colors.textPrimary` | Main text (white) |
| `Colors.textSecondary` | Secondary text (light gray) |

## Button Styles

### Light Theme
```swift
Button("Press me") {}
    .primaryButtonStyle()       // Teal filled button
    .secondaryButtonStyle()     // Teal outlined button
```

### Dark Theme
```swift
Button("Press me") {}
    .darkPrimaryButtonStyle()       // Teal filled button
    .darkSecondaryButtonStyle()     // Teal outlined button
```

## Adding New Theme Colors

To add a new color to both themes:

1. **AppTheme.swift** - Add to `Colors` struct:
```swift
struct Colors {
    static let myNewColor = Color(red: 0.5, green: 0.5, blue: 0.5)
}
```

2. **DarkAppTheme.swift** - Add the dark variant:
```swift
struct Colors {
    static let myNewColor = Color(red: 0.3, green: 0.3, blue: 0.3)
}
```

3. **Use in views**:
```swift
Text("Text")
    .foregroundStyle(AppTheme.Colors.myNewColor)           // Light theme
    .foregroundStyle(DarkAppTheme.Colors.myNewColor)       // Dark theme
```

## Current Implementation Status

✅ **Complete:**
- Light theme system (AppTheme.swift)
- Dark theme system (DarkAppTheme.swift)
- Theme Manager setup (ThemeManager.swift)
- Welcome screens styled with AppTheme
- Login screen styled with AppTheme

🔄 **Next Steps:**
- Integrate ThemeManager for dynamic switching
- Add theme toggle UI component
- Update all views to support both themes
- Add system theme detection (light/dark mode preference)

## Migration Guide

To update an existing view from hardcoded colors to theme system:

**Before:**
```swift
Text("Hello")
    .foregroundStyle(Color(red: 0.13, green: 0.85, blue: 0.77))
    .font(.system(size: 28, weight: .bold))
```

**After (Light Theme):**
```swift
Text("Hello")
    .foregroundStyle(AppTheme.Colors.primary)
    .font(AppTheme.Fonts.titleLarge)
```

**After (Dark Theme):**
```swift
Text("Hello")
    .foregroundStyle(DarkAppTheme.Colors.primary)
    .font(DarkAppTheme.Fonts.titleLarge)
```

## Best Practices

1. **Always use theme constants** - Never hardcode colors or font sizes
2. **Keep both themes synchronized** - Update both AppTheme and DarkAppTheme
3. **Use view extensions** - Use `.primaryButtonStyle()` instead of manual styling
4. **Test both themes** - Verify UI in light and dark modes
5. **Group related changes** - Update colors, fonts, and sizes together

## Performance Considerations

- Theme constants are computed properties (no runtime overhead)
- AppStorage keeps user preference across sessions
- @Observable ensures Previews update correctly

## Troubleshooting

**Colors not updating?**
- Ensure you're using the correct theme constants
- Check if Preview is using the right theme
- Restart Xcode if changes don't appear

**Button styles not applying?**
- Verify button is using `.primaryButtonStyle()` modifier
- Check that frame/padding is applied after the style
- Ensure all constraints are satisfied

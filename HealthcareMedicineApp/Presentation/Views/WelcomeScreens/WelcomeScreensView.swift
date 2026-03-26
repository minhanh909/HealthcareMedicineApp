import SwiftUI

struct WelcomeScreensView: View {
    @State var currentPage = 0
    var onLoginTapped: (() -> Void)?
    var onCreateAccountTapped: (() -> Void)?

    var body: some View {
        ZStack {
            LightAppTheme.Colors.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Current screen based on page
                Group {
                    if currentPage == 0 {
                        Welcome1View(onNextTapped: {
                            currentPage = 1
                        })
                    } else if currentPage == 1 {
                        Welcome2View(
                            onBackTapped: {
                                currentPage = 0
                            },
                            onNextTapped: {
                                currentPage = 2
                            }
                        )
                    } else {
                        Welcome3View(
                            onLoginTapped: onLoginTapped,
                            onCreateAccountTapped: onCreateAccountTapped
                        )
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .trailing)))
                .animation(.easeInOut(duration: 0.4), value: currentPage)
                .frame(maxHeight: .infinity)
                
                // Pagination dots
                HStack(spacing: LightAppTheme.Spacing.spacingXS) {
                    ForEach(0..<3, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? LightAppTheme.Colors.primary : Color.gray.opacity(0.3))
                            .frame(width: 10, height: 10)
                            .animation(.easeInOut(duration: 0.3), value: currentPage)
                    }
                    Spacer()
                }
                .padding(.horizontal, LightAppTheme.Spacing.spacingXL)
                .padding(.vertical, LightAppTheme.Spacing.spacingXL)
            }
        }
    }
}


#Preview {
    WelcomeScreensView()
}

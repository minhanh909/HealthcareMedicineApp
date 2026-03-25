import SwiftUI

struct WelcomeScreensView: View {
    @State var currentPage = 0
    var onLoginTapped: (() -> Void)?
    var onCreateAccountTapped: (() -> Void)?
    
    private let tealColor = Color(red: 0.13, green: 0.85, blue: 0.77)
    private let darkColor = Color(red: 0.02, green: 0.12, blue: 0.22)
    
    var body: some View {
        ZStack {
            // Light background
            Color(red: 0.95, green: 0.96, blue: 0.97)
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
                .frame(maxHeight: .infinity)
                
                // Pagination dots
                HStack(spacing: 8) {
                    ForEach(0..<3, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? tealColor : Color.gray.opacity(0.3))
                            .frame(width: 10, height: 10)
                            .animation(.easeInOut(duration: 0.3), value: currentPage)
                    }
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
            }
        }
    }
}

#Preview {
    WelcomeScreensView()
}

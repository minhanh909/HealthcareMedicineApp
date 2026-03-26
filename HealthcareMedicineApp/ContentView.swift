//
//  ContentView.swift
//  HealthcareMedicineApp
//
//  Created by Minh Anh on 15/3/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showWelcomeScreens = true
    @State private var backFromLogin: Bool = false
    @State private var viewModel = AppContainer.shared.makeLoginViewModel()

    var body: some View {
        if showWelcomeScreens {
            WelcomeScreensView(
                currentPage: backFromLogin ? 2 : 0,
                onLoginTapped: {
                    showWelcomeScreens = false
                },
                onCreateAccountTapped: {
                    showWelcomeScreens = false
                }
            )
        } else {
            LoginView(
                viewModel: viewModel,
                onBackTapped: {
                    showWelcomeScreens = true
                    backFromLogin = true
                }
            )
        }
    }
}

#Preview {
    ContentView()
}



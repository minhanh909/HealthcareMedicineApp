import SwiftUI


struct LoginView: View {
    @State var viewModel: LoginViewModel
    var onBackTapped: (() -> Void)?

    var body: some View {
        VStack {
//            Color(red: 0.95, green: 0.96, blue: 0.97)
//                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    header
                    titleSection
                    securityCard
                    formSection
                    forgotPassword
                    signInButton
                    statusSection
                    dividerSection
                    socialButtons
                    footer
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 24)
            }
        }
    }
    
    private var header: some View {
//        HeaderCustomView(onBackTapped: onBackTapped)
        HeaderCustomView {
            onBackTapped?()
        }
    }
    

    private var titleSection: some View {
        TitleSectionCustom()
    }

    private var securityCard: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Color(red: 0.72, green: 0.91, blue: 0.88))
            .frame(height: 124)
            .overlay {
                Image(systemName: "shield.fill")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(Color(red: 0.35, green: 0.87, blue: 0.81))
            }
    }

    private var formSection: some View {
        FormSectionCustom(viewModel: $viewModel)
    }

    private var forgotPassword: some View {
        HStack {
            Spacer()
            Button("Forgot Password?") {}
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(Color(red: 0.13, green: 0.85, blue: 0.77))
        }
    }

    private var signInButton: some View {
        Button(action: viewModel.signInTapped) {
            HStack(spacing: 10) {
                Spacer()
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(Color(red: 0.02, green: 0.12, blue: 0.22))
                } else {
                    Text("Sign In")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                    Image(systemName: "arrow.right")
                        .font(.system(size: 25, weight: .bold))
                }
                Spacer()
            }
            .foregroundStyle(Color(red: 0.02, green: 0.12, blue: 0.22))
            .frame(height: 72)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(red: 0.13, green: 0.85, blue: 0.77))
            )
            .shadow(color: Color(red: 0.08, green: 0.77, blue: 0.71).opacity(0.35), radius: 10, x: 0, y: 6)
        }
        .disabled(viewModel.isLoading)
    }

    @ViewBuilder
    private var statusSection: some View {
        if let successMessage = viewModel.successMessage {
            Text(successMessage)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.green)
                .frame(maxWidth: .infinity, alignment: .center)
        } else if let errorMessage = viewModel.errorMessage {
            Text(errorMessage)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.red)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }

    private var dividerSection: some View {
        HStack(spacing: 10) {
            Rectangle()
                .fill(Color(red: 0.88, green: 0.90, blue: 0.93))
                .frame(height: 1)

            Text("OR CONTINUE WITH")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(Color(red: 0.62, green: 0.67, blue: 0.74))

            Rectangle()
                .fill(Color(red: 0.88, green: 0.90, blue: 0.93))
                .frame(height: 1)
        }
        .padding(.top, 2)
    }

    private var socialButtons: some View {
        SocialButtonsCustom(viewModel: viewModel)
    }

    private var footer: some View {
        HStack(spacing: 6) {
            Text("Don't have an account?")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color(red: 0.44, green: 0.52, blue: 0.63))

            Button("Create Account") {}
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color(red: 0.13, green: 0.85, blue: 0.77))
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }

    
}







#Preview {
    LoginView(viewModel: AppContainer.shared.makeLoginViewModel())
}


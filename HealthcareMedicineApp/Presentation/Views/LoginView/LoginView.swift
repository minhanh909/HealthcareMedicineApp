import SwiftUI

struct LoginView: View {
    @State var viewModel: LoginViewModel
    var onBackTapped: (() -> Void)?

    var body: some View {
        ZStack {
            LightAppTheme.Colors.background
                .ignoresSafeArea()
            
            VStack {
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
                    .padding(.horizontal, LightAppTheme.Spacing.spacingXL)
                    .padding(.top, LightAppTheme.Spacing.spacingMedium)
                    .padding(.bottom, LightAppTheme.Spacing.spacingXL)
                }
            }
        }
    }
    
    private var header: some View {
        HeaderCustomView(onBackTapped: onBackTapped)
    }
    

    private var titleSection: some View {
        TitleSectionCustom()
    }

    private var securityCard: some View {
        RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
            .fill(LightAppTheme.Colors.primaryLight)
            .frame(height: 124)
            .overlay {
                Image(systemName: "shield.fill")
                    .font(.system(size: LightAppTheme.Sizes.iconLarge, weight: .bold))
                    .foregroundStyle(LightAppTheme.Colors.primary)
            }
    }

    private var formSection: some View {
        FormSectionCustom(viewModel: $viewModel)
    }

    private var forgotPassword: some View {
        HStack {
            Spacer()
            Button("Forgot Password?") {}
                .font(LightAppTheme.Fonts.buttonSmall)
                .foregroundStyle(LightAppTheme.Colors.primary)
        }
    }

    private var signInButton: some View {
        Button(action: viewModel.signInTapped) {
            HStack(spacing: 10) {
                Spacer()
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(LightAppTheme.Colors.primaryDark)
                } else {
                    Text("Sign In")
                        .font(LightAppTheme.Fonts.buttonLarge)
                    Image(systemName: "arrow.right")
                        .font(.system(size: 16, weight: .semibold))
                }
                Spacer()
            }
            .foregroundStyle(LightAppTheme.Colors.primaryDark)
            .frame(height: LightAppTheme.Sizes.buttonHeightMedium)
            .background(
                RoundedRectangle(cornerRadius: LightAppTheme.Sizes.cornerRadiusMedium, style: .continuous)
                    .fill(LightAppTheme.Colors.primary)
            )
            .withPrimaryShadow()
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
                .fill(LightAppTheme.Colors.borderLight)
                .frame(height: 1)

            Text("OR CONTINUE WITH")
                .font(LightAppTheme.Fonts.captionSmall)
                .foregroundStyle(LightAppTheme.Colors.textSecondary)

            Rectangle()
                .fill(LightAppTheme.Colors.borderLight)
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
                .font(LightAppTheme.Fonts.bodyMedium)
                .foregroundStyle(LightAppTheme.Colors.textSecondary)

            Button("Create Account") {}
                .font(LightAppTheme.Fonts.buttonMedium)
                .foregroundStyle(LightAppTheme.Colors.primary)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }

    
}







#Preview {
    LoginView(viewModel: AppContainer.shared.makeLoginViewModel())
}


import Foundation

@MainActor
@Observable
final class LoginViewModel {
    var email = ""
    var password = ""
    var isLoading = false
    var errorMessage: String?
    var successMessage: String?

    private let signInWithCredentialsUseCase: SignInWithCredentialsUseCase
    private let signInWithSocialUseCase: SignInWithSocialUseCase

    init(
        signInWithCredentialsUseCase: SignInWithCredentialsUseCase,
        signInWithSocialUseCase: SignInWithSocialUseCase
    ) {
        self.signInWithCredentialsUseCase = signInWithCredentialsUseCase
        self.signInWithSocialUseCase = signInWithSocialUseCase
    }

    func signInTapped() {
        Task {
            await performSignIn()
        }
    }

    func signInWithGoogleTapped() {
        Task {
            await performSocialSignIn(provider: .google)
        }
    }

    func signInWithAppleTapped() {
        Task {
            await performSocialSignIn(provider: .apple)
        }
    }

    private func performSignIn() async {
        isLoading = true
        errorMessage = nil
        successMessage = nil

        do {
            let session = try await signInWithCredentialsUseCase.execute(email: email, password: password)
            successMessage = "Welcome, \(session.userID)!"
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    private func performSocialSignIn(provider: SocialProvider) async {
        isLoading = true
        errorMessage = nil
        successMessage = nil

        do {
            let session = try await signInWithSocialUseCase.execute(provider: provider)
            successMessage = "Signed in as \(session.userID)."
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}

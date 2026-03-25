import Foundation

final class AppContainer {
    static let shared = AppContainer()

    private let authRepository: AuthRepository

    private init(authRepository: AuthRepository = MockAuthRepository()) {
        self.authRepository = authRepository
    }

    func makeLoginViewModel() -> LoginViewModel {
        let credentialsUseCase = SignInWithCredentialsUseCase(repository: authRepository)
        let socialUseCase = SignInWithSocialUseCase(repository: authRepository)

        return LoginViewModel(
            signInWithCredentialsUseCase: credentialsUseCase,
            signInWithSocialUseCase: socialUseCase
        )
    }
}

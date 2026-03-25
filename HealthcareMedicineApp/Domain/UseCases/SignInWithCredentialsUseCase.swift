import Foundation

struct SignInWithCredentialsUseCase {
    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(email: String, password: String) async throws -> AuthSession {
        let credentials = LoginCredentials(email: email.trimmingCharacters(in: .whitespacesAndNewlines), password: password)

        guard credentials.isValid else {
            throw AuthError.invalidInput
        }

        return try await repository.signIn(with: credentials)
    }
}

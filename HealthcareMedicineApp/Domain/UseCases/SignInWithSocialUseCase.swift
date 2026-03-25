import Foundation

struct SignInWithSocialUseCase {
    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(provider: SocialProvider) async throws -> AuthSession {
        try await repository.signIn(with: provider)
    }
}

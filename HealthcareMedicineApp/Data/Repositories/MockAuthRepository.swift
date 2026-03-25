import Foundation

final class MockAuthRepository: AuthRepository {
    func signIn(with credentials: LoginCredentials) async throws -> AuthSession {
        try await Task.sleep(for: .milliseconds(450))

        guard credentials.email.lowercased() == "name@example.com", credentials.password == "password123" else {
            throw AuthError.invalidCredentials
        }

        return AuthSession(userID: "demo-user", token: UUID().uuidString)
    }

    func signIn(with provider: SocialProvider) async throws -> AuthSession {
        try await Task.sleep(for: .milliseconds(350))

        let userID: String
        switch provider {
        case .google:
            userID = "google-user"
        case .apple:
            userID = "apple-user"
        }

        return AuthSession(userID: userID, token: UUID().uuidString)
    }
}

import Foundation

enum AuthError: LocalizedError {
    case invalidCredentials
    case invalidInput

    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Invalid email or password."
        case .invalidInput:
            return "Please enter valid credentials."
        }
    }
}

protocol AuthRepository {
    func signIn(with credentials: LoginCredentials) async throws -> AuthSession
    func signIn(with provider: SocialProvider) async throws -> AuthSession
}

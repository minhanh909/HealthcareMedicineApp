import Foundation

struct LoginCredentials {
    let email: String
    let password: String

    var isValid: Bool {
        email.contains("@") && password.count >= 6
    }
}

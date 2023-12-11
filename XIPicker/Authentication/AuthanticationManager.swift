//
//  AuthanticationManager.swift
//  XIPicker
//
//  Created by Valid Mohammadi on 10.12.2023.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthanticationManager {
    
    static let shared = AuthanticationManager()
    
    private init() {
    }
    
    
    func createUser(email: String, password: String  ) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return  AuthDataResultModel(user: authDataResult.user)
        
    }
}

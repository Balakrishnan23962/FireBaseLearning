//
//  AuthManager.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import Foundation
import FirebaseAuth


protocol AuthManagerProtocol {
    
    func createUser(email: String, password: String) async throws -> AuthDataResultsModel
    func getAuthenticatedUser() throws -> AuthDataResultsModel
    func signInUser(email: String, password : String) async throws -> AuthDataResultsModel
    func resetPassword(email : String) async throws
    func signOut() throws
    func updateEmail(email: String) async throws
    func updatePassword(password: String) async throws
    @discardableResult
    func signInGoogle(tokens: GIDSignInUSerModel) async throws -> AuthDataResultsModel
    func signIn(credential: AuthCredential) async throws -> AuthDataResultsModel
}


final class AuthManager: AuthManagerProtocol {
   
    static let shared : AuthManagerProtocol = AuthManager()
    private init() { }
    
    func createUser(email: String, password : String) async throws -> AuthDataResultsModel {
        let authDataResults = try await Auth.auth().createUser(withEmail: email, password: password)
        let results = AuthDataResultsModel(user: authDataResults.user)
        return results
    }
    
    func getAuthenticatedUser() throws -> AuthDataResultsModel {
        guard let user = Auth.auth().currentUser else {
            throw FirebaseError.newUser
        }
        
        return AuthDataResultsModel(user: user)
    }
    
    func signInUser(email: String, password : String) async throws -> AuthDataResultsModel {
        let authDataResults = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultsModel(user: authDataResults.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw FirebaseError.newUser
        }
        try await user.updatePassword(to: password)
    }
    func updateEmail(email: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw FirebaseError.newUser
        }
        try await user.updateEmail(to: email)
    }
    
}

extension AuthManager {
    
    func signIn(credential: AuthCredential) async throws -> AuthDataResultsModel {
        let authData = try await Auth.auth().signIn(with: credential)
        return AuthDataResultsModel(user: authData.user)
    }
    
    func signInGoogle(tokens: GIDSignInUSerModel) async throws -> AuthDataResultsModel {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken , accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }
    
}

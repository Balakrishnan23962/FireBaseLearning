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
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultsModel(user: user)
    }
    
}

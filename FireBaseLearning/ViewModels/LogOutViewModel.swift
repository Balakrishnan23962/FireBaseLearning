//
//  LogOutViewModel.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import Foundation


final class LogOutViewModel : ObservableObject {
    
    
    private let authManager : AuthManagerProtocol
    
    init(authManager : AuthManagerProtocol = AuthManager.shared){
        self.authManager = authManager
    }
    
    func logout() {
        Task{
            do{
                try authManager.signOut()
            }
            catch{
                print("Error in LogOut")
            }
        }
    }
    
    func resetPassword() async throws {
        
        let results = try authManager.getAuthenticatedUser()
        guard let email = results.email else {
            throw FirebaseError.emailNotFound
        }
        
        try await authManager.resetPassword(email: email)
        
    }
    
    func updateEmail() async throws {
        let email = "123@gmail.com"
        try await authManager.updateEmail(email: email)
        
    }
    
    func updatePassword() async throws {
        let password = "123bfgfff"
        try await authManager.updatePassword(password: password)
    }
    
}

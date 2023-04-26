//
//  SignInViewModel.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import Foundation
import Combine

@MainActor
final class SignInViewModel : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    
    private let authManager : AuthManagerProtocol
    
    init(authManager : AuthManagerProtocol = AuthManager.shared) {
        self.authManager = authManager
    }
}

extension SignInViewModel {
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No Email or Password Found")
            return
        }
        
        Task{
            do {
                let results = try await authManager.createUser(email: email, password: password)
                print("\(results)")
            }
            catch {
                print("Error : \(error)")
            }
        }
    }
    
}

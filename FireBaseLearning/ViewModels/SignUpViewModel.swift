//
//  SignUpViewModel.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import Foundation


final class SignUpViewModel : ObservableObject {
    
    @Published var showSignInView : Bool = false
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var isSignIn : Bool = false
    
    private let authManager : AuthManagerProtocol
    
    init(authManager : AuthManagerProtocol = AuthManager.shared) {
        self.authManager = authManager
    }
    
    func getRegisteredUser(){
        Task{
            do {
              let results = try authManager.getAuthenticatedUser()
              print("\(results)")
                if results.email == nil {
                    showSignInView = true
                }
            }
            catch {
                print("Error : \(error)")
            }
        }
        
    }
    
    func signUp() {
        isSignIn = true
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

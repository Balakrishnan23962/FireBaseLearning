//
//  SignUpViewModel.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import Foundation


final class SignUpViewModel : ObservableObject {
    
    @Published var showSignInView : Bool = false
    
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
    
}

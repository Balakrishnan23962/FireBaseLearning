//
//  GoogleSignInViewModel.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 27/04/23.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift


final class GoogleSignInViewModel: ObservableObject {
    
    
    func signInGoogle() async throws {
        
        let tokens = try await GoogleHelpers().signIn()
        
        try await AuthManager.shared.signInGoogle(tokens: tokens)
    }
    
}

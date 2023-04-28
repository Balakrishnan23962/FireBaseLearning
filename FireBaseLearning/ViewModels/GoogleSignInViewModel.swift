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
        
        guard let topVC = await Utilities.shared.topViewController() else {
            throw TopViewControllerError.noTopViewController
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC )
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw TopViewControllerError.noAccessToken
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString
        
        let tokens = GIDSignInUSerModel(idToken: idToken, accessToken: accessToken)
        
        try await AuthManager.shared.signInGoogle(tokens: tokens)
    }
    
}

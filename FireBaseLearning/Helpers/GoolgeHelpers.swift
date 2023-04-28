//
//  GoolgeHelpers.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 28/04/23.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift


final class GoogleHelpers {
    
    
    func signIn() async throws -> GIDSignInUSerModel {
        
        guard let topVC = await Utilities.shared.topViewController() else {
            throw TopViewControllerError.noTopViewController
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC )
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw TopViewControllerError.noAccessToken
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString
        
        let tokens = GIDSignInUSerModel(idToken: idToken, accessToken: accessToken)
        
        return tokens
    }
    
}

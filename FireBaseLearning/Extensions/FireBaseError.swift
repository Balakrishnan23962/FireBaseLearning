//
//  FireBaseError.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 27/04/23.
//

import Foundation


enum FirebaseError : LocalizedError {
    
    case emailNotFound
    case passwordNill
    case newUser
    case localUser
    
}

extension FirebaseError {
    public var errorDescription: String? {
        switch self {
        case .emailNotFound:
            return NSLocalizedString("Email Not Found", comment: "Please provide Email")
        case .passwordNill:
            return NSLocalizedString("Password Not Found", comment: "Please provide Password")
        case .newUser:
            return NSLocalizedString("You are a new user", comment: "SignUp first")
        case .localUser:
            return NSLocalizedString("You already registered with our app", comment: "SignIn here")
        }
    }
}

enum TopViewControllerError : LocalizedError {
    case noTopViewController
    case noAccessToken
    case noIdToken
}


extension TopViewControllerError {
    public var errorDescription: String? {
        switch self {
        case .noTopViewController:
            return NSLocalizedString("No UIViewController here", comment: "Provide UIViewController")
        case .noAccessToken:
            return NSLocalizedString("You have no Access Token", comment: "Provide an access Token")
        case .noIdToken:
            return NSLocalizedString("You have no IdToken Token", comment: "Provide an IdToken  Token")
        }
    }
}

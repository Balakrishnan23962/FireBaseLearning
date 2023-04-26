//
//  SignInModel.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import Foundation
import FirebaseAuth

struct AuthDataResultsModel {
    var uid : String
    var email : String?
    var photoUrl: String?
    
    init(user : User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

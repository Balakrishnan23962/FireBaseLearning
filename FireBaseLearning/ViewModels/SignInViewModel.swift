//
//  SignInViewModel.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import Foundation


final class SingInViewModel : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
}

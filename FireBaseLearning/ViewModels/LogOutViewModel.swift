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
    
}

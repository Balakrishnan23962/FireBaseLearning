//
//  LogOutView.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import SwiftUI

struct LogOutView: View {
    
    @StateObject var viewModel = LogOutViewModel()
    @Binding var showSignIn : Bool
    var body: some View {
        Form {
            Section {
                Button {
                    viewModel.logout()
                    showSignIn = true
                } label: {
                    Text("Logout")
                        .foregroundColor(.red)
            }
            }
            Section {
                Button {
                    Task{
                        do{
                            try await viewModel.resetPassword()
                            print("Password Reset successful")
                        }
                        catch{
                            print("Error in reset password, \(error)")
                        }
                    }
                } label: {
                    Text("Reset Password")
            }
            }
            Section {
                Button {
                    Task{
                        do {
                            try await viewModel.updateEmail()

                        }
                        catch{
                            print("Error in update Email")
                        }
                    }
                } label: {
                    Text("Update Email")
                }

            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LogOutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LogOutView(showSignIn: .constant(false))
        }
    }
}

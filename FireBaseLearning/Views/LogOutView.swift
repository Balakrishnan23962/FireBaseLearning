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
        List {
            Button {
                viewModel.logout()
                showSignIn = true
            } label: {
                Text("Logout")
                    .foregroundColor(.red)
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

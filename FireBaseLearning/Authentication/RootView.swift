//
//  RootView.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var viewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack{
            NavigationStack {
                TabView {
                    LogOutView(showSignIn: $viewModel.showSignInView)
                        .tabItem {
                            Image(systemName: "house.fill")
                        }
                }
            }
        }
        .onAppear{
            viewModel.getRegisteredUser()
        }
        .fullScreenCover(isPresented: $viewModel.showSignInView,onDismiss: {
            dismiss()
        }) {
            NavigationStack{
                SignInView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

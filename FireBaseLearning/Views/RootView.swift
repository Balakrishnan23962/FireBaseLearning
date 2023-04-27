//
//  RootView.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var viewModel = SignUpViewModel()

    var body: some View {
        
        ZStack{
            NavigationStack {
                LogOutView(showSignIn: $viewModel.showSignInView)
            }
        }
        .onAppear{
            viewModel.getRegisteredUser()
        }
        .fullScreenCover(isPresented: $viewModel.showSignInView) {
            NavigationStack{
                SignUpView(showSignIn: $viewModel.showSignInView)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

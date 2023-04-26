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
                TabView {
                    SignInView()
                        .tabItem {
                            Image(systemName: "house.fill")
                        }
                }
            }
        }
        .onAppear{
            viewModel.getRegisteredUser()
        }
        .fullScreenCover(isPresented: $viewModel.showSignInView) {
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

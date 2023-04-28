//
//  SignInView.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SignUpView: View {
    @StateObject var viewModel = GoogleSignInViewModel()
    @Binding var showSignIn : Bool
    var body: some View {
        NavigationStack {
            VStack{
                NavigationLink {
                    EmailView(isSignIn: $showSignIn)
                } label: {
                    Text("SignUp with Email")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                        
                }
                .padding()
                HStack{
                    Text("Already have an account?")
                    NavigationLink {
                       SignInView(isSignIn: $showSignIn)
                    } label: {
                        Text("SignIn")
                            
                    }
                }
                GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark,style: .icon,state: .pressed)) {
                    Task {
                        do {
                            try await viewModel.signInGoogle()
                            showSignIn = false
                        } catch {
                            print("Error in google Signin")
                        }
                    }
                }
                
                Spacer()

            }
            .padding()
            .navigationTitle("Register")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SignUpView(showSignIn: .constant(false))
        }
    }
}

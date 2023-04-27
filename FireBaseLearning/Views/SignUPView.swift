//
//  SignInView.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
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

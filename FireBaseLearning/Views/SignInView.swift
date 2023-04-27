//
//  SignInView.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 27/04/23.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    @Binding var isSignIn : Bool
    var body: some View {
        VStack{
            TextField("Email....", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(.bottom)
            Button {
                viewModel.signIn()
                isSignIn = false
            } label: {
                Text("SignIn")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom)
            HStack{
                Text("Don't have an account?")
                NavigationLink {
                    EmailView(isSignIn: $isSignIn)
                } label: {
                    Text("SignUp")
                }

            }
            Spacer()
            .navigationTitle("SignIn")
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInView(isSignIn: .constant(false))
        }
    }
}

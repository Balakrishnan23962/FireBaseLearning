//
//  EmailView.swift
//  FireBaseLearning
//
//  Created by Gasc_Internship1 on 26/04/23.
//

import SwiftUI

struct EmailView: View {
    
    @StateObject var viewModel = SignUpViewModel()
    
    @Binding var isSignIn : Bool
    
    @Environment(\.dismiss) var dismiss
    
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
                viewModel.signUp()
                isSignIn = false
            } label: {
                Text("SignUp")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom)
            HStack{
                Text("Already have an account?")
                NavigationLink {
                    SignInView(isSignIn: $isSignIn)
                } label: {
                    Text("SignIn ")
                }

            }
       
            Spacer()
        }
        .padding()
        .navigationTitle("SignUp with Email")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EmailView(isSignIn: .constant(true))
        }
    }
}

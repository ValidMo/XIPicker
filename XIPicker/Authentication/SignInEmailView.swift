//
//  SignInEmailView.swift
//  XIPicker
//
//  Created by Valid Mohammadi on 10.12.2023.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No Email or password found.")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthanticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
    
    
}
struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                viewModel.signIn()
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        
        }
        .padding()
        .navigationTitle("Sign In With Email")
    }
        
        
}

#Preview {
    NavigationStack{
        SignInEmailView()
    }
}

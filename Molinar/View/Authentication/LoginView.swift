//
//  LoginView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/29/22.
//
import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
//                BackgroundView()
                VStack {
                    
                    Image("AppLogo")
                        .resizable()
//                        .background(Color.black.opacity(0))
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                        .padding(.top, 220)
                        .padding(.bottom)
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .background(Color(.init(white: 0,alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .background(Color(.init(white: 0,alpha: 0.15)))
                            .cornerRadius(10)
                            .padding(.vertical)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 100)
                    .padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()
                        Button(action: {}, label: {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .foregroundColor(.blue)
                                .padding(.top, 8)
                                .padding(.trailing, 32)
                        })
                    }
                    
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(.blue)
                            .cornerRadius(25)
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    Spacer()
                    
                    NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true), label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                                
                        }
                        .foregroundColor(.blue)
                        .padding(.bottom, 60)
                    })
                    
                    Spacer()
                   
                    
                        
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


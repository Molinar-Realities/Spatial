//
//  RegistrationView.swift
//  autopilot
//
//  Created by Molinar, Matthew A on 11/29/22.
//
import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var username = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel

    
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack {
            VStack {
                
                Button(action: {
                    showImagePicker.toggle()
                }, label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipped()
                                .cornerRadius(70)
                                .padding(.top, 220)
                        } else {
                            Image("plus_photo")
                                .resizable()
                                .background(Color.black.opacity(0))
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 220)
                                .padding(.bottom)
                        }
                        
                    }
                    
                    
                })
//                .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
//                    ImagePicker(image: $selectedUIImage)
//                })
                
                
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .background(Color(.init(white: 0,alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                        .background(Color(.init(white: 0,alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "envelope")
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
                
                
                Button(action: {
                    viewModel.registerUser(email: email, password: password, username: username, fullname: fullname)
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(.blue)
                        .cornerRadius(25)
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss()}, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                            
                    }
                    .foregroundColor(.blue)
                    .padding(.bottom, 150)
                })
                
                Spacer()
               
                
                    
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

//
//  AuthViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 2/24/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?

    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login: \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func signOut() {
        userSession = nil
        user = nil
        try? Auth.auth().signOut()
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error
            in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid
                ]
            Firestore.firestore().collection("users").document(user.uid)
                .setData(data) { _ in
                    self.userSession = user
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let data = snapshot?.data() else { return }
            self.user = User(dictionary: data)
            
        }
    }
}


//
//  AuthViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 2/24/23.
//

import SwiftUI
import Foundation
import Firebase
import FirebaseStorage
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?

    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    
    // MARK: - Login
    func login(withEmail email: String, password: String) {
        isAuthenticating = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login: \(error.localizedDescription)")
                self.error = error
                self.isAuthenticating = false
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    // MARK: - Sign out
    func signOut() {
        userSession = nil
        user = nil
        // TODO: CLEAR TASKS
        try? Auth.auth().signOut()
    }
    
    // MARK: - Register user
    func registerUser(email: String, password: String, username: String, name: String, profileImage: UIImage, age: String, grade: String) {
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: failed to upload image: \(error.localizedDescription)")
                return
            }
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("Error \(error.localizedDescription)")
                        return
                    }

                    guard let user = result?.user else { return }
                    let data = [
                        "email": email,
                        "name": name,
                        "age": age,
                        "grade": grade,
                        "profilePictureUrl": profileImageUrl,
                        "profileDescription": "Edit profile to edit your profile description!",
                        "uid": user.uid,
                        "username": username
                    ]
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("uploading user data...")
                        self.userSession = user
                        self.fetchUser()
                    }
                    
//                    let docRef = COLLECTION_TASKS.document()
//
//                    var createdAt = Date()
//                    
//                    let taskData: [String: Any] = ["uid": user.uid, "title": "Make your first task with the +", "id": docRef.documentID, "coordinate": [30.285142, -97.739490], "locationTitle": "Tasks have locations, try it!", "dueDate": Date(), "completed": false, "locationCreatedAt": [30.285142, -97.739490], "createdAt": createdAt]
//
//                    docRef.setData(taskData) { _ in
//                        print("DEBUG: Successfully uploaded onboarding task.")
//                    }
//
//                    let docRef2 = COLLECTION_TASKS.document()
//
//                    let task2Data: [String: Any] = ["uid": user.uid, "title": "matt's number: 281-570-7383", "id": docRef2.documentID, "coordinate": [30.270836, -97.738306], "locationTitle": "lmk what you want on the app", "dueDate": Date(), "completed": false, "locationCreatedAt": [30.285142, -97.739490], "createdAt": createdAt]
//
//
//
//                    docRef2.setData(task2Data) { _ in
//                        print("DEBUG: successfully uploaded second onboarding task.")
//                    }
                    
                    
                    
                }
            }
        }
    }
    
    // MARK: - fetch user
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                self.error = error
                return
            }
            guard let data = snapshot?.data() else { return }
            self.user = User(dictionary: data)
        }
    }
}

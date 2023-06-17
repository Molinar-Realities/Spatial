//
//  MovesView.swift
//  Molinar
//
//  Created by Matthew Molinar on 6/15/23.
//

import SwiftUI

struct MovesHome: View {
    var body: some View {
        
            VStack {
                ForEach(0 ..< 10) { item in
                    MoveCell()
                }
            }
        
    }
}

struct MovesHome_Previews: PreviewProvider {
    static var previews: some View {
        MovesHome()
    }
}

struct MoveCell: View {
    @State private var viewCount: Int = 0

    var body: some View {
        
            ZStack() {
                Image("afternoon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                VStack(spacing: 0) {
                    HStack {
    //                    Text("Matt Molinar")
    //                        .font(.headline)
    //                        .foregroundColor(.black)
    //                        .animation(.easeInOut(duration: 0.3))
    //                        .padding()

                        Spacer()
                    }
                    Spacer()
                    
                    VStack(spacing: 0) {
                        HStack {
                            Text("Matt Molinar")
                                .foregroundColor(.white)
                                .padding(.leading, 32)
                                .padding(.top)
                            
                            Text("3h ago")
                                .foregroundColor(.white)
                                .padding(.top)
                                .font(.system(size: 12))
                            
                            
                            Spacer()
                            
                            
                            Button(action: {
                                // Action when button is tapped
                                print("Love button was tapped!")
                            }) {
                                Image(systemName: "heart") // Use your own image or icon
                                    .foregroundColor(.white)
                                    .padding(.trailing, 4)
                                    .padding(.top)
                            }
                            Text("32")
                                .foregroundColor(.white)
                                .padding(.trailing, 32)
                                .padding(.top)
                        }

                            

                        HStack {
                            Text("Just got a photo with Yang!")
                                .foregroundColor(.white)
                                .padding(.horizontal, 32)

                            .font(.system(size: 14))
                            Spacer()
                            Image(systemName: "chart.bar.fill")
                                .foregroundColor(.white)
                                .padding(.trailing, 4)
                                .font(.system(size: 12))
                            Text("15")
                                .foregroundColor(.white)
                                .padding(.trailing, 38)
                                .font(.system(size: 12))
                            
                            
                        }
                        .padding(.bottom)

                    }
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .multilineTextAlignment(.leading)
                    .overlay {
                        Image("matt")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 38, height: 38)
                            .offset(x: -160, y: -40)
                            
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 300)
            .clipped()
        .cornerRadius(15)
        
    }
}

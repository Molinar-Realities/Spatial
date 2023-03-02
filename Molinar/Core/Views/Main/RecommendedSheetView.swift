//
//  RecommendedSheetView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/12/23.
//

import SwiftUI

struct RecommendedSheetView: View {
    @Binding var presented: Bool
    @Binding var selectedIndex: Int

    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Image("WorkspaceWallpaper")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button(action: {
                        presented.toggle()
                        selectedIndex = 0
                    }) {
                        Image(systemName: "chevron.down.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    VStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 75)
                            .overlay {
                                VStack {
                                    Text("41")
                                        .font(.title)
                                    Text("MIN")
                                }
                                .foregroundColor(.white)
                            }
                        
                    }
                    .foregroundColor(.black)
                    Spacer()
                    // Just a hacky fix to make the shit be centered....
                    Button(action: {
                        presented.toggle()
                    }) {
                        Image(systemName: "gear")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.gray)
                    }
                    .disabled(true) //<----
                    .hidden() //<-----
                }
                .padding(.horizontal, 24)
                Spacer()
                VStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 250, height: 200)
                        .overlay {
                            VStack {
                                HStack {
                                    Text("Today's Workout")
                                        .font(.headline)
                                }
                                Spacer()
                                HStack {
                                    Text("Kettlebell Conditioning")
                                        .font(.title2)
                                }
                                HStack {
                                    Text("MVMT + MOB")
                                }
                                Spacer()
                            }
                            .padding()
                            .foregroundColor(.white)
                        }
                    
                    
                }
                Spacer()
                VStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 200, height: 100)
                        .overlay {
                            VStack {
                                HStack {
                                    Text("Equipment")
                                        .font(.headline)
                                }
                                Spacer()
                                HStack {
                                    Text("Bench, Kettlebell")
                                }
                            }
                            .padding()
                            .foregroundColor(.white)
                        }
                    
                }
                Spacer()
                HStack {
                    Button(action: {}) {
                        Image(systemName: "list.bullet")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                        .foregroundColor(Color(.systemGray))
                    }
                    Spacer()
                    NavigationLink(destination: WorkspaceView(sheetPresented: $presented).environmentObject(BottomSheetViewModel.shared)) {
                            VStack {
                                Spacer()
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(.white)
                                    .frame(width: 14, height: 14)
                                Text("START")
                                    .foregroundColor(.white)
                                    .font(Font.system(size: 14))
                                    .padding(.top, 2)
                                    
                                Spacer()
                                 
                            }
                        }
                        .frame(width: 90, height: 90)
                        .background(.blue)
                        .clipShape(Circle())
                    .offset(y: -40)
                    
                    Spacer()
                    Image(systemName: "list.bullet")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(Color(.systemGray6))
                                        .opacity(0)
                }
                .frame(height: 100)
                .padding(.horizontal, 70)
                .background(Color(.systemGray6))
                .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 0, y: 5)

            }
            .padding(.top, 60) //<--- Hacky Fix... this makes it not appear in the safe area.
        }
        
    }
}


struct RecommendedSheetView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedSheetView(presented: .constant(true), selectedIndex: .constant(1))
    }
}


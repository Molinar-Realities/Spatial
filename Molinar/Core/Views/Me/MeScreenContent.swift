//
//  MeScreenContent.swift
//  Molinar
//
//  Created by Matt Molinar on 2/21/23.
//

import SwiftUI

struct MeScreenContent: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                AnalyticsCards()
                
                EnergyHeadline()
                
                Text("Energy Graph Coming Soon.")
                Spacer()
                Text("Spacer")
                
                
                
                

            }
            .padding()
        }
    }
}

struct MeScreenContent_Previews: PreviewProvider {
    static var previews: some View {
        MeScreenContent()
    }
}

struct AnalyticsCards: View {
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {}) {
                VStack {
                    Image("sleep")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 112, height: 93)
                        .cornerRadius(5)
                        .overlay {
                            VStack {
                                Text("4 hrs")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Good")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                            }
                            .foregroundColor(.white)
                        }
                    HStack {
                        Text("Sleep Debt")
                        Spacer()
                    }
                }
            }
            
            Button(action: {}) {
                VStack {
                    Image("afternoon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 112, height: 93)
                        .cornerRadius(5)
                        .overlay {
                            VStack {
                                Text("6:24pm")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("5 tasks")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                        }
                    HStack {
                        Text("Evening Peak")
                        Spacer()
                    }
                }
            }
            
            Button(action: {}) {
                VStack {
                    Image("evening")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 112, height: 93)
                        .cornerRadius(5)
                        .overlay {
                            VStack {
                                Text("11:32pm")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("3 habits")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                        }
                    HStack {
                        Text("Wind down")
                        Spacer()
                    }
                }
            }
            
            
        }
    }
}

struct EnergyHeadline: View {
    var body: some View {
        HStack {
            Text("Today's Energy")
                .font(.headline)
            
            Spacer()
        }
        .padding(.vertical)
    }
}

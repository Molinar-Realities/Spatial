//
//  TaskFocusNow.swift
//  Molinar
//
//  Created by Matt Molinar on 3/6/23.
//

import SwiftUI

struct TaskFocusNow: View {
    @EnvironmentObject var tasksViewModel: TasksViewModel

    var body: some View {
      
        // Main VStack
            VStack(alignment: .leading, spacing: 15) {
//                Text("Focus Now")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.horizontal)
                // Card slide shows
                    
                // Tasks from Calendar

                VStack(alignment: .leading, spacing: 5) {
                    // Header for Tasks from Calendar
                    Text("Recommended")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    // ScrollView for cards
                    RecommendedTasks()
                }
                
                
                
                // Your tasks, top projects
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 5) {
                    //Header
                        Text("Your Tasks")
                            .font(.headline)
                            .padding(.leading)
                        .fontWeight(.bold)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(.systemGray))
                            .fontWeight(.bold)
                    }
                    
                    TasksList()
                    
                }
                
               
                
                
                
            }
        
    }
}

struct TaskFocusNow_Previews: PreviewProvider {
    static var previews: some View {
        TaskFocusNow()
    }
}

struct RecommendedTasks: View {
    @EnvironmentObject var viewModel: TasksViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                // HACK
                Rectangle()
                    .frame(width: 10, height: 187)
                    .foregroundColor(.clear)
                // HACK
                ForEach(viewModel.userTasks) { task in
                    VStack(alignment: .leading, spacing: 10) {
                        // TO DO: Make the cards from Apple Music.
                        FeaturedCard(task: task)
                        
                        
                        
                        
                        
                    }
                }
                // HACK
                Rectangle()
                    .frame(width: 10, height: 187)
                    .foregroundColor(.clear)
                // HACK
            }
        }
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct FeaturedCard: View {
    @State private var animate = false

    var task: Task
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
//            Image("study")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 155, height: 155)
//                .cornerRadius(10)
//                .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 2)
//                .padding(.bottom, 5)
//            Text(task.title)
//                .frame(width: 155, alignment: .leading)
//                .lineLimit(1)
//                .truncationMode(.tail)
//            Text(task.locationTitle)
//                .frame(width: 155, alignment: .leading)
//                .foregroundColor(.gray)
//                .lineLimit(1)
//                .truncationMode(.tail)
            
            VStack {
                        ZStack {
                            Circle()
                                .fill(.red)
                                .blur(radius: 10)
                                .offset(x:animate ? 10 : 130,y:animate ? 20 : 160)
                                .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.5, y: animate ? 0.2 : 0.7, z: animate ? 0.4 : 0))
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.pink)
                                .blur(radius: 20)
                                .offset(x: animate ? -120 : 10,y :animate ? -100 : 20)
                                .rotation3DEffect(.degrees(animate ? 80 : 20), axis: (x: animate ? 0.4 : 0, y: animate ? 0 : 0.1, z: animate ? 0 : 0.5))
                            Rectangle()
                                .fill(.green)
                                .blur(radius: 30)
                                .offset(x: animate ? -60 : 20,y: animate ? 5 : 140)
                                .rotation3DEffect(.degrees(animate ? 20 : 50), axis: (x: animate ? 0 : 0, y: animate ? 0.4 : 0.2, z: animate ? 0.9 : 0.3))
                            Capsule()
                                .fill(.mint)
                                .blur(radius: 40)
                                .offset(x: animate ? 60 : 0,y: animate ? -10 : 140)
                                .rotation3DEffect(.degrees(animate ? -30 : 0), axis: (x: animate ? 0.6 : 0.1, y: animate ? 0.2 : 0.3, z: animate ? 0.1 : 0.4))
                            Circle()
                                .fill(.blue)
                                .blur(radius: 50)
                                .offset(x: animate ? 90 : -10,y:animate ? -90 : 40)
                                .rotation3DEffect(.degrees(animate ? 10 : 0), axis: (x: animate ? 0.4 : 0.6, y: animate ? 0.1 : 0, z: animate ? 0.6 : 0.4))
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.teal)
                                .blur(radius: 60)
                                .offset(x: animate ? -90 : 40,y:animate ? 90 : -20)
                                .rotation3DEffect(.degrees(animate ? -20 : 10), axis: (x: animate ? 0 : 0.2, y: animate ? 0 : 0 , z: animate ? 0.4 : 0))
                            Capsule()
                                .fill(.yellow)
                                .blur(radius: 70)
                                .offset(x: animate ? 10 : 170 ,y:animate ? 0 : -150)
                                .opacity(0.4)
                                .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.1, y: animate ? 0.5 : 0.1, z: animate ? 0.2 : 0.6))
                            
                            VStack() {
                                HStack {
                                    VStack(alignment:.leading,spacing:15) {
//                                        HStack(spacing:0) {
//                                            Image("AppLogo")
//                                                .resizable()
//                                                .scaledToFill()
//                                                .frame(width: 18, height: 18)
//
//                                        }
                                        Text(task.title)
                                            .bold()
                                            .lineLimit(nil)
                                            .minimumScaleFactor(0.8)


//                                            .font(.system(size: 40, weight: .heavy))
                                        
                                    }
                                    Spacer()
                                }.padding().padding()
                                Spacer()
                                Text(task.locationTitle)
                                    .font(.system(size: 14))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(.ultraThinMaterial)
                                    .multilineTextAlignment(.center)
                                    .minimumScaleFactor(0.8)

                            }.foregroundColor(.white)
                            
                        }.frame(width: UIScreen.main.bounds.width - 60,height: UIScreen.main.bounds.height/5)
                            .clipped()
                            .cornerRadius(15)
//                            .shadow(color: Color.black.opacity(0.25), radius: 25, x: 0, y: 20)
                            .onAppear() {
                                withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                                    animate.toggle()
                                }
                            }
                        
                    }
        }
    }
}

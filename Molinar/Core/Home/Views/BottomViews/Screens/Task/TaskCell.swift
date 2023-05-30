import SwiftUI
import Dispatch
import Firebase

struct TaskCell: View {
    @State private var isAnimatingCheckmark = false
    @State var removed = false
    var completed: Bool
    @State var copyCompleted: Bool
    var dueDate: Date
    var title: String
    var location: String
    var id: String
    @State private var animate = false
    
    init(completed: Bool, dueDate: Date, title: String, location: String, id: String) {
        self.completed = completed
        self.dueDate = dueDate
        self.title = title
        self.location = location
        self.id = id
        self._copyCompleted = State(initialValue: completed)
    }
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                    .blur(radius: 10)
                    .offset(x: animate ? 10 : 130, y: animate ? 20 : 160)
                    .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.5, y: animate ? 0.2 : 0.7, z: animate ? 0.4 : 0))
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                    .blur(radius: 20)
                    .offset(x: animate ? -120 : 10, y: animate ? -100 : 20)
                    .rotation3DEffect(.degrees(animate ? 80 : 20), axis: (x: animate ? 0.4 : 0, y: animate ? 0 : 0.1, z: animate ? 0 : 0.5))
                Rectangle()
                    .fill(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                    .blur(radius: 30)
                    .offset(x: animate ? -60 : 20, y: animate ? 5 : 140)
                    .rotation3DEffect(.degrees(animate ? 20 : 50), axis: (x: animate ? 0 : 0, y: animate ? 0.4 : 0.2, z: animate ? 0.9 : 0.3))
                Capsule()
                    .fill(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                    .blur(radius: 40)
                    .offset(x: animate ? 60 : 0, y: animate ? -10 : 140)
                    .rotation3DEffect(.degrees(animate ? -30 : 0), axis: (x: animate ? 0.6 : 0.1, y: animate ? 0.2 : 0.3, z: animate ? 0.1 : 0.4))
                Circle()
                    .fill(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                    .blur(radius: 50)
                    .offset(x: animate ? 90 : -10, y: animate ? -90 : 40)
                    .rotation3DEffect(.degrees(animate ? 10 : 0), axis: (x: animate ? 0.4 : 0.6, y: animate ? 0.1 : 0, z: animate ? 0.6 : 0.4))
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                    .blur(radius: 60)
                    .offset(x: animate ? -90 : 40, y: animate ? 90 : -20)
                    .rotation3DEffect(.degrees(animate ? -20 : 10), axis: (x: animate ? 0 : 0.2, y: animate ? 0 : 0, z: animate ? 0.4 : 0))
                Capsule()
                    .fill(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                    .blur(radius: 70)
                    .offset(x: animate ? 10 : 170, y: animate ? 0 : -150)
                    .opacity(0.4)
                    .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.1, y: animate ? 0.5 : 0.1, z: animate ? 0.2 : 0.6))
                VStack {
                    HStack {
                        Text(dueDate.isToday ? dueDate.toString(dateFormat: "h:mm a") : dueDate.toString(dateFormat: "MMM d"))
                            .font(.headline)
                            .foregroundColor(.white)
                            .opacity(copyCompleted ? 0.5 : 1)
                            .strikethrough(copyCompleted ? true : false)
                            .animation(.easeInOut(duration: 0.3))
                            .padding()

                        Spacer()
                    }
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        Button(action: {
//                            let impact = UIImpactFeedbackGenerator(style: .medium)
//                            impact.impactOccurred()
//                            withAnimation {
//                                copyCompleted.toggle()
//                                self.isAnimatingCheckmark = true
//                            }
//                            Firestore.firestore().collection("tasks").document(id).updateData([
//                                "completed": copyCompleted
//                            ]) { error in
//                                if let error = error {
//                                    print("Error updating task: \(error.localizedDescription)")
//                                }
//                            }
//                        }) {
//                            Image(systemName: copyCompleted ? "play.circle.fill" : "play.circle.fill")
//                                .resizable()
//                                .frame(width: 24, height: 24)
//                                .foregroundColor(copyCompleted ? .green : .blue)
//                                .rotationEffect(Angle(degrees: self.isAnimatingCheckmark ? 360 : 0))
//                                .animation(.easeInOut(duration: 0.3))
//                                .onAppear {
//                                    self.isAnimatingCheckmark = false
//                                }
//                        }
//                        Spacer()
//                    }
//                    .animation(.easeInOut(duration: 0.3))
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .foregroundColor(.white)
                            .strikethrough(copyCompleted ? true : false)
                            .opacity(copyCompleted ? 0.5 : 1)
                            .animation(.easeInOut(duration: 0.3))
                            .padding(4)

                        Text(location)
                            .padding(4)
                            .font(.system(size: 14))
                    }
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .multilineTextAlignment(.leading)
                }
                .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width - 60, height: UIScreen.main.bounds.height / 5)
            .clipped()
            .cornerRadius(15)
            .onAppear() {
                withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                    animate.toggle()
                }
            }
        }
    }
}


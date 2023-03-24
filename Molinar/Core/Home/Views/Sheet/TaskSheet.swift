//
//  TaskSheet.swift
//  Molinar
//
//  Created by Matt Molinar on 3/2/23.
//

import SwiftUI
import Dispatch
import CoreLocation
import UserNotifications
import NaturalLanguage
import Combine





struct TaskSheet: View {
    @State private var deadlineTextString = ""
    @State private var taskTitle = ""
    @FocusState private var taskNameInFocus: Bool
    @State private var description = ""
    @Binding var showingSheet: Bool
    @State private var selectedDate = Date()
    @State var showDueDate = false
    @State var moveIsPublic = false
    
    @State private var deadline = Date()
    
    @State var locationText = ""
    @Binding var presentationDetents: [PresentationDetent]
    @State var showLocationSearch = false
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @StateObject var taskUpload = UploadTaskViewModel()
    @StateObject var locationManager = LocationManager()
    
    
    // MARK: -  DetectTime
    
    
    func detectTime(text: String) -> Date? {
        let regex = try! NSRegularExpression(pattern: "\\b(1[012]|[1-9])(:[0-5]\\d)?([ap]m)?\\b", options: [.caseInsensitive])
        let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
        print("DEBUG: matches \(matches)")
        
        guard let match = matches.first else {
            return nil
        }
        
        var timeString = (text as NSString).substring(with: match.range)
        print("DEBUG: timestring \(timeString)")
        let formatter = DateFormatter()
//        formatter.timeZone = TimeZone(identifier: "UTC")

        let today = Date()
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: today)

        if timeString.contains("am") || timeString.contains("pm") {
            var hour = ""
            var minute = ""
            var suffix = ""
            
            if timeString.contains(" ") {
                let timeComponents = timeString.components(separatedBy: " ")
                if timeComponents.count == 2 {
                    let time = timeComponents[0]
                    let timeParts = time.components(separatedBy: ":")
                    hour = timeParts[0]
                    minute = timeParts.count > 1 ? timeParts[1] : "00"
                    suffix = timeComponents[1]
                } else if timeComponents.count == 3 {
                    hour = timeComponents[0]
                    minute = timeComponents[1]
                    suffix = timeComponents[2]
                }
            } else {
                let suffixIndex = timeString.index(timeString.endIndex, offsetBy: -2)
                let time = String(timeString[..<suffixIndex])
                let timeParts = time.components(separatedBy: ":")
                hour = timeParts[0]
                minute = timeParts.count > 1 ? timeParts[1] : "00"
                suffix = String(timeString[suffixIndex...])
            }
            
            let paddedHour = hour.count == 1 ? "0\(hour)" : hour
            let paddedMinute = minute.count == 1 ? "0\(minute)" : minute
            formatter.dateFormat = "h:mm a"
            timeString = "\(paddedHour):\(paddedMinute) \(suffix)"
        } else if timeString.contains(":") && !timeString.contains(" ") {
            formatter.dateFormat = "HH:mm"
        } else if timeString.lowercased() == "noon" {
            formatter.dateFormat = "h:mm a"
            timeString = "12:00 PM"
        } else if timeString.lowercased() == "midnight" {
            formatter.dateFormat = "h:mm a"
            timeString = "12:00 AM"
        } else {
            formatter.dateFormat = "H"
        }

        if let time = formatter.date(from: timeString) {
            components.hour = calendar.component(.hour, from: time)
            components.minute = calendar.component(.minute, from: time)
            components.second = calendar.component(.second, from: time)

            let detectedDeadline = calendar.date(from: components)!
            return detectedDeadline
        } else {
            return nil
        }

        
    }
    
    // MARK: - scheduleReminder

    
    func scheduleReminder(for task: Task) {
        let content = UNMutableNotificationContent()
        content.title = "Moves"
        content.body = "\(task.title)"
        content.sound = UNNotificationSound.default
        
        let dueDate = task.dueDate
        if let dueDate = task.dueDate {
            let reminderDate = dueDate.addingTimeInterval(-30 * 60)
            let reminderTime = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminderDate)
            let trigger = UNCalendarNotificationTrigger(dateMatching: reminderTime, repeats: false)
            
            let request = UNNotificationRequest(identifier: task.id, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }

    }
    
    // MARK: - getDeadlineColor()
    
    // Returns the color of the deadline text based on its proximity to today's date
        func getDeadlineColor() -> Color {
            let calendar = Calendar.current
            if calendar.isDateInToday(deadline) {
                return .green
            } else if calendar.isDateInTomorrow(deadline) {
                return .yellow
            } else if calendar.isDate(deadline, equalTo: Date(), toGranularity: .weekOfYear) {
                return .purple // Replace with your own color for this week's deadlines
            } else {
                return .gray // Replace with your own color for deadlines beyond this week
            }
        }
    
    // MARK: - getDeadlineText()
    
    // Returns the text of the deadline based on its proximity to today's date
    func getDeadlineText() -> String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        
        print("DEBUG: within deadlineText \(deadline)")

        if calendar.isDateInToday(deadline) {
//            formatter.dateFormat = "h:mm a"
            return "Today " + deadline.toString(dateFormat: "h:mm a")
        } else if calendar.isDateInTomorrow(deadline) {
            formatter.dateFormat = "h:mm a"
            return "Tomorrow " + deadline.toString(dateFormat: "h:mm a")
        } else if calendar.isDate(deadline, equalTo: Date(), toGranularity: .weekOfYear) {
            formatter.dateFormat = "EEE h:mm a" // Use "EEE" for abbreviated day names like "Mon", "Tue", etc.
            return deadline.toString(dateFormat: "EEE h:mm a")
        } else {
            formatter.dateFormat = "MMM d h:mm a" // Use "MMM d" for abbreviated month name and day number like "Mar 30"
            return deadline.toString(dateFormat: "MMM d h:mm a")
        }
    }
    
    func removeTimePhrase(from string: String) -> String {
        let pattern = "((at)?\\s*\\d{1,2}(\\s*:\\s*\\d{2})?\\s*(am|pm)?)"
        let taskTextWithoutTime = string.replacingOccurrences(of: pattern, with: "", options: .regularExpression)
        return taskTextWithoutTime
    }

    
    

    
    
    
    









    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            if !showLocationSearch {
                TextField("What's the move?", text: $taskTitle)
                    .focused($taskNameInFocus)
                    .textFieldStyle(.plain)
                    .padding(.horizontal)
                    .cornerRadius(10)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            taskNameInFocus = true
                        }
                    }
                    .onReceive(Just(taskTitle)) { text in
                        // Detect time here
                        if let date = detectTime(text: text) {
                            // Do something with the detected date
                            print("DEBUG: date \(date)")
                            deadline = date
                        }
                    }
                   
                
                HStack {
                    Image(systemName: "mappin")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 6, height: 6)
                        .foregroundColor(Color("TrustBlue"))
                    Text(viewModel.selectedLocationTitle ?? "Current Location")
                        .foregroundColor(Color(.systemGray3))
                }
                .padding(.horizontal)
                    .onTapGesture {
                        print("location clicked")
                        withAnimation(.spring()) {
                            showLocationSearch = true
                            presentationDetents = [.large]
                            
                        }
                        
                    }
                
                Divider()
                HStack(spacing: 15) {
                    Button(action: {
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.prepare()
                        generator.impactOccurred()
                        showDueDate.toggle()
                    }) {
                        HStack {
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 12, height: 12)
                                .foregroundColor(getDeadlineColor())
                            Text(getDeadlineText())
                                .foregroundColor(getDeadlineColor())
                        }
                    }
                    Button(action: {
                        moveIsPublic.toggle()
                        // TODO: make it easier to submit a post into the world. Users dont want to fucking hit another button before hitting send.
                        // TODO: could be a slider that you slide to the right to post, and left to make a task.
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.prepare()
                        generator.impactOccurred()
                    }) {
                        if moveIsPublic {
                            HStack {
                                Image(systemName: "globe.americas.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(Color("TrustBlue"))
                                Text("Everyone")
                                    .foregroundColor(.gray)
                            }
                        } else {
                            HStack {
                                Image(systemName: "lock.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.blue)
                                Text("Fam")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                    }
                    
                    // MARK: - Add Task
                    Spacer()
                    Button(action: {
                        // Generate haptic feedback
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.prepare()
                        generator.impactOccurred()
                        scheduleReminder(for: Task(dictionary: ["dueDate": deadline, "title": taskTitle, "id": UUID().uuidString]))
                        taskUpload.uploadTask(title: removeTimePhrase(from: taskTitle), coordinate: viewModel.selectedLocationCoordinate ?? locationManager.currentLocation!.coordinate, locationTitle: (viewModel.selectedLocationTitle ?? locationManager.currentLocationTitle) ?? "Error", dueDate: deadline, locationCreatedAt:  locationManager.currentLocation?.coordinate ??  CLLocationCoordinate2D(latitude: 0, longitude: 0))
                        viewModel.queryFragment = ""
                        showingSheet.toggle()
                    }) {
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 28, height: 28)
                            .padding(.horizontal)
                    }
                    .disabled(taskTitle.isEmpty)
                }
                .padding(.leading)
                

                Spacer()

            }
            if showLocationSearch {
                LocationSearchView(showLocationSearch: $showLocationSearch, presentationDetents: $presentationDetents)
                
            }
                
                
            
            
//            TextField("Notes", text: $description)
//                .textFieldStyle(.plain)
//                .padding(.horizontal)
//                .cornerRadius(10)
            
        }
        .padding(.vertical)
//        .frame(height: !showLocationSearch ? 140 : UIScreen.main.bounds.height)
        .popover(isPresented: $showDueDate) {
            ScheduleSheet(deadline: $deadline, showingSheet: $showDueDate)
                
                
        }
        
        
        
        
    }
    
    
}

struct TaskSheet_Previews: PreviewProvider {
    static var previews: some View {
        TaskSheet(showingSheet: .constant(true), presentationDetents: .constant([.medium]))
    }
}



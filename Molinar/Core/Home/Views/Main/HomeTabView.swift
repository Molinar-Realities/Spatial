import SwiftUI

struct HomeTabView: View {
    @Binding var isShowingTaskSheet: Bool
    @Binding var selectedIndex: Int
    var icons: [String]
    @Binding var selectedFeed: FeedFilterOptions

    var body: some View {
        HStack {
            Spacer()
            ForEach(0..<icons.count) { index in
                Spacer()

                Button(action: {
                    handleButtonTap(index: index)
                }) {
                    TabButtonView(icon: icons[index], selectedIndex: selectedIndex, index: index)
                }
                
                Spacer()
            }
            Spacer()
        }
        .padding(.top, 4)
        .background(Color.black)
    }
    
    private func handleButtonTap(index: Int) {
        if index == 0 {
            selectedFeed = .tasks
        }
        
        
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
        
        if index != 2 {
            selectedIndex = index

        } else {
   
            isShowingTaskSheet.toggle()
        }
    }
}

struct TabButtonView: View {
    let icon: String
    let selectedIndex: Int
    let index: Int
    
    var body: some View {
        VStack {
            Image(systemName: selectedIndex == index ? "\(icon).fill" : icon)
                .font(.system(size: 25))
                .foregroundColor(selectedIndex == index ? .white : Color(UIColor.gray))
            
            if index == 0 {
                Text("Schedule")
                    .font(.caption2)
                    .foregroundColor(selectedIndex == index ? .white : Color(UIColor.gray))
            } else if index == 1 {
                Text("Explore")
                    .font(.caption2)
                    .foregroundColor(selectedIndex == index ? .white : Color(UIColor.gray))
            } else if index == 3 {
                Text("Friends")
                    .font(.caption2)
                    .foregroundColor(selectedIndex == index ? .white : Color(UIColor.gray))
            } else if index == 4 {
                Text("Messages")
                    .font(.caption2)
                    .foregroundColor(selectedIndex == index ? .white : Color(UIColor.gray))
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView(isShowingTaskSheet: .constant(false), selectedIndex: .constant(0), icons: ["globe.americas.fill", "plus.app.fill", "figure.2.arms.open"], selectedFeed: .constant(.home))
    }
}


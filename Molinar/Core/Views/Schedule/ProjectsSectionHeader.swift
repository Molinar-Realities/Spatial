import SwiftUI

struct ProjectsSectionHeader: View {
    var title: String
    @Binding var isExpanded: Bool
    @Binding var showNewProjectSheet: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Button(action: {
                self.showNewProjectSheet.toggle()
            }) {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.gray)
                
            }
            .padding(.horizontal)
            .sheet(isPresented: self.$showNewProjectSheet) {
                Text("HI")
            }
            Button(action: {
                self.isExpanded.toggle()
            }) {
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ProjectsSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsSectionHeader(title: "Projects", isExpanded: .constant(false), showNewProjectSheet: .constant(false))
    }
}

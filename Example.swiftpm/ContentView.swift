import SwiftUI
import InstanceList
import InstanceListUI

struct ContentView: View {
    
    @State
    var text: String = ""
    
    var body: some View {
        VStack {
            TextField("Instance Name", text: $text)
                .textFieldStyle(.roundedBorder)
                .suggestionPresentable(text: $text)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


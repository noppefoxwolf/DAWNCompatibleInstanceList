import SwiftUI
import InstanceList

extension View {
    public func suggestionPresentable(text: Binding<String>) -> some View {
        modifier(InstanceSuggestionModifier(text: text))
    }
}

struct InstanceSuggestionModifier: ViewModifier {
    
    @Binding
    var text: String
    
    @State
    var suggestions: [String] = []
    
    @State
    var instanceList = InstanceList()
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                List {
                    ForEach(suggestions, id: \.self) { suggestion in
                        Button {
                            text = suggestion
                        } label: {
                            Text(suggestion)
                        }
                    }
                }
                .listStyle(.plain)
                .background()
                .mask(RoundedRectangle(cornerRadius: 16))
                .frame(height: 220)
                .shadow(radius: 4)
                .alignmentGuide(.bottom) {
                    $0[.top] - 10
                }
                .animation(.default, value: suggestions)
                .opacity(suggestions.isEmpty ? 0 : 1)
            }
            .onChange(of: text) { _, newValue in
                let urls = instanceList.search(newValue, maxLength: .max)
                suggestions = urls
                    .filter({ $0.host()! != text })
                    .compactMap({ $0.host() })
            }
            .task {
                try? await instanceList.load()
            }
    }
}

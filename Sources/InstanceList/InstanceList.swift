import Foundation

@MainActor
public final class InstanceList {
    var urls: [URL] = []
    
    public init() {}
    
    public func load() async throws {
        let url = Bundle.module.url(forResource: "data", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        urls = try decoder.decode([URL].self, from: data)
    }
    
    public func search(_ query: String, maxLength: Int = 10) -> ArraySlice<URL> {
        return urls
            .filter({ queryFilter($0, query: query) })
            .prefix(maxLength)
    }
    
    func queryFilter(_ url: URL, query: String) -> Bool {
        guard let lowercasedHost = url.host()?.lowercased() else { return false }
        let lowercasedQuery = query.lowercased()
        return lowercasedHost.contains(lowercasedQuery)
    }
}

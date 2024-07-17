import InstanceList
import Testing

@Suite
final class InstanceListTests {
    let instanceList = try! InstanceList()
    
    @Test
    func getURLTest() async throws {
        let urls = await instanceList.search("mst", maxLength: 1)
        #expect(urls[0].host() == "mstdn.jp")
        #expect(urls.count == 1)
    }
}

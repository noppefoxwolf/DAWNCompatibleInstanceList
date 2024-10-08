import Foundation

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
let data = try encoder.encode(urls)

let currentFilePath = URL(filePath: FileManager.default.currentDirectoryPath)
let url = currentFilePath.appending(
    components: "Sources", "InstanceList", "Resources", "data.json"
)
try data.write(to: url)

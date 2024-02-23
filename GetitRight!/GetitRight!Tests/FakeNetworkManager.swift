import Foundation
import XCTest
@testable import GetitRight_

final class FakeNetworkManager: NetworkAble {
    
    func getDataFromNetwork<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        let bundle = Bundle(for: FakeNetworkManager.self)
        let url = bundle.url(forResource: url.absoluteString, withExtension: "json")
        guard let url = url else {
            throw ApiError.urlError
        }
        do {
            let rawData = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(modelType.self, from: rawData)
            return result
        } catch {
            throw error
        }
    }
    
    
    
}

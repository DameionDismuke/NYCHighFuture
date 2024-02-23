
import Foundation

final class NetworkManager {
    let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
}

extension NetworkManager: NetworkAble {
    func getDataFromNetwork<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let parsedData = try decoder.decode(modelType, from: data)
        
        return parsedData
    }
}

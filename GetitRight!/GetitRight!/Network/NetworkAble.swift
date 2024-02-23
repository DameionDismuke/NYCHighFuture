
import Foundation

protocol NetworkAble {
    func getDataFromNetwork<T: Decodable> (url:URL, modelType: T.Type) async throws -> T
}

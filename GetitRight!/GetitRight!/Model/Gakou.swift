
import Foundation

struct Gakou: Decodable {
    let dbn: String
    let schoolName, boro, overviewParagraph: String
}

extension Gakou: Identifiable {
    var id: String {
        return dbn
    }
}

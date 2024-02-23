
import Foundation

final class GakouViewModel: ObservableObject {
    
    @Published var gakouArray = [Gakou]()
    
    @Published var apiError: ApiError?
    
    private var manager: NetworkAble
    
    init(manager: NetworkAble) {
        self.manager = manager
    }

}

protocol GakouViewModelActions {
    func getGakouListFrom(urlString: String) async
    
    
    
}

extension GakouViewModel: GakouViewModelActions {
    @MainActor func getGakouListFrom(urlString: String) async {
        guard let url = URL(string: urlString)
        else {
            apiError = ApiError.urlError
            return
        }
        do {
            let gakouArray = try await manager.getDataFromNetwork(url: url, modelType: [Gakou].self)
            self.gakouArray = gakouArray
            print(self.gakouArray)
        } catch {
            self.apiError = ApiError.dataError
            print(error.localizedDescription)
        }
    }
}

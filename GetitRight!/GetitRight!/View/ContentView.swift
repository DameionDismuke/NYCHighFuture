import SwiftUI

struct ContentView: View {
    @StateObject var gakouViewModel = GakouViewModel(manager: NetworkManager(urlSession: URLSession.shared))
    
    var body: some View {
        NavigationStack {
            VStack {
                List(gakouViewModel.gakouArray){
                    gakou in
                    NavigationLink {
                        DetailView(gakouObj: gakou)
                    } label: {
                        GakouCell(gakou: gakou)
                    }
                }
            }
            .task {
                await
                gakouViewModel.getGakouListFrom(urlString: Constant.endpoint)
            }
            .navigationTitle("Gakou")
        }
    }
}

#Preview {
    ContentView()
}

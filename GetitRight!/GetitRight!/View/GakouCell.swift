import SwiftUI

struct GakouCell: View {
    var gakou: Gakou
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text(gakou.schoolName)
                Text(gakou.dbn)
            }
        }
        
    }
}

//#Preview {
//    GakouCell(gakou: <#Gakou#>)
//}

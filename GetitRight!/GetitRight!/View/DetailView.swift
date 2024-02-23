
import SwiftUI

struct DetailView: View {
    var gakouObj: Gakou
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("School Name: " + (gakouObj.schoolName))
            Text("DBN: " + (gakouObj.dbn))
            
            Text("Overview Paragraph: " + (gakouObj.overviewParagraph))
        }
        .padding()
    }
}

//#Preview {
//    DetailView()
//}

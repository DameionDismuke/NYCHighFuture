import Foundation
import XCTest
@testable import GetitRight_

@MainActor
final class GakouViewModelTests: XCTestCase {

    var gakouViewModel: GakouViewModel!
    
    override func setUpWithError() throws {
        gakouViewModel = GakouViewModel(manager: FakeNetworkManager())
    }
    
    override func tearDownWithError() throws {
        gakouViewModel = nil
    }
    
    func test_whenWeAreExpecting_NoData_whenweDontPassURL() async throws {
        await gakouViewModel.getGakouListFrom(urlString: "")
        
        XCTAssertEqual(gakouViewModel.gakouArray.count, 0)
        
        XCTAssertNotNil(gakouViewModel.apiError)
        
        XCTAssertEqual(gakouViewModel.apiError, ApiError.urlError)
    }
    
    func test_whenWeAreExpecting_Data_whenwePassURL() async throws {
        await gakouViewModel.getGakouListFrom(urlString: "School")
        
        XCTAssertNotNil(gakouViewModel.gakouArray.count)
        
//        XCTAssertNil(gakouViewModel.apiError)
        
        XCTAssertNotEqual(gakouViewModel.apiError, nil)
    }

}

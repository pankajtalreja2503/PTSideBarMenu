import XCTest
@testable import PTSideBarMenu

final class PTSideBarMenuTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        if #available(iOS 13.0, *) {
//            XCTAssertEqual(PTSideBarMenu().text, "Hello, World!")
        } else {
            // Fallback on earlier versions
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

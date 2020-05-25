import XCTest
@testable import ClosureSubscription

final class ClosureSubscriptionTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ClosureSubscription().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

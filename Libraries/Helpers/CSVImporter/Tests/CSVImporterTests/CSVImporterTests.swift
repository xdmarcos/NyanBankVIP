import XCTest
@testable import CSVImporter

final class CSVImporterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CSVImporter().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

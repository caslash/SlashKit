import XCTest
@testable import SlashKit

final class SlashKitTests: XCTestCase {
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        XCTAssertEqual(SlashKit().text, "Hello, World!")
//    }
    
    #if canImport(UIKit)
    func testUIColorToHex() throws {
        let white = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        XCTAssertEqual("#ffffff", white.toHexString())
    }
    #endif
    
    #if canImport(AppKit)
    func testNSColorToHex() throws {
        let black = NSColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        XCTAssertEqual("#000000", black.toHexString())
    }
    #endif
}

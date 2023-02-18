import XCTest
@testable import SlashKit

final class SlashKitTests: XCTestCase {
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
    
    func testStringSubscript() throws {
        let name = "Slash"
        XCTAssertEqual("S", name[0])
        XCTAssertEqual("l", name[1])
        XCTAssertEqual("a", name[2])
        XCTAssertEqual("s", name[3])
        XCTAssertEqual("h", name[4])
    }
    
    func testStringSubscriptIteration() throws {
        let name = "Slash"
        
        for i in 0..<name.count {
            let expected = name[i]
            let actual = name[name.index(name.startIndex, offsetBy: i)]
            XCTAssertEqual(expected, actual)
        }
    }
}

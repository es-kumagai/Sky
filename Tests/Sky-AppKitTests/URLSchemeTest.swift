//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/08/21.
//

import XCTest
@testable import Sky_AppKit

final class TestScheme : URLScheme {
    
    static let scheme = "testscheme"
    static let host = "check"
    
    static func action(url: URL) {
        
        XCTAssertEqual(url.absoluteString, "testscheme://check?action")
    }
}

final class URLSchemeTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
    }

    func testIdentifier() throws {

        let scheme = TestScheme.self
        let url1 = URL(string: "testscheme://check?action")!
        let url2 = URL(string: "testscheme://check?xxxxxx")!
        let url3 = URL(string: "testscheme://xxxx?xxxxxx")!

        XCTAssertTrue(scheme.matches(url1))
        XCTAssertTrue(scheme.matches(url2))
        XCTAssertFalse(scheme.matches(url3))
    }
}

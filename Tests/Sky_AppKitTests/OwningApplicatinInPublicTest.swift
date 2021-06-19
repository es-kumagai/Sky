//
//  File.swift
//
//
//  Created by Tomohiro Kumagai on 2021/06/19.
//

import XCTest
import Sky_AppKit

final class OwningApplicationInPublicTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testIdentifier() throws {
        
        XCTAssertEqual(OwningApplication.microsoftExcel.identifier, "com.microsoft.Excel")
    }
}

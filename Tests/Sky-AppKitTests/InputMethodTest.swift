//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/06/20.
//

import XCTest
@testable import Sky_AppKit

final class InputMethodTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testSelectInputSourceWithoutRomajiTypingInID() throws {
        
        let inputMethod = InputMethod()
        let reservedInputSource = inputMethod.currentInputSource
        
        defer {
            
            inputMethod.select(inputSource: reservedInputSource)
        }
        
        let inputSources = inputMethod.inputSources(havingInputSourceID: "com.apple.inputmethod.Kotoeri.Japanese", includeAllInstalled: false)
        
        if let inputSource = inputSources.first {

            XCTFail("Expected found no input sources, but found \(inputSource)")
        }
        else {
            
        }
    }
    
    func testCharacterPaletteIM() throws {
     
        let inputMethod = InputMethod()
        let inputSources = inputMethod.inputSources(havingInputSourceID: "com.apple.CharacterPaletteIM")
        
        if let inputSource = inputSources.first {

            XCTAssertEqual(inputSource.id, "com.apple.CharacterPaletteIM")
            XCTAssertEqual(inputSource.localizedName, "絵文字と記号")
            XCTAssertEqual(inputSource.category, "TISCategoryPaletteInputSource")
            XCTAssertEqual(inputSource.type, "TISTypeCharacterPalette")
            XCTAssertEqual(inputSource.languages, ["en"])
            XCTAssertTrue(inputSource.isASCIICapable)
            XCTAssertTrue(inputSource.isSelectCapable)
            XCTAssertTrue(inputSource.isEnableCapable)
            XCTAssertTrue(inputSource.isEnabled)
        }
    }
    
    func test50onPaletteIM() throws {
     
        let inputMethod = InputMethod()
        let inputSources = inputMethod.inputSources(havingInputSourceID: "com.apple.50onPaletteIM")
        
        if let inputSource = inputSources.first {

            XCTAssertEqual(inputSource.id, "com.apple.50onPaletteIM")
            XCTAssertEqual(inputSource.localizedName, "かなパレット")
            XCTAssertEqual(inputSource.category, "TISCategoryPaletteInputSource")
            XCTAssertEqual(inputSource.type, "TISTypeCharacterPalette")
            XCTAssertEqual(inputSource.languages, ["ja"])
            XCTAssertFalse(inputSource.isASCIICapable)
            XCTAssertTrue(inputSource.isSelectCapable)
            XCTAssertTrue(inputSource.isEnableCapable)
            XCTAssertTrue(inputSource.isEnabled)
        }
    }
    
    func testKotoeriRoman() throws {
        
        let inputMethod = InputMethod()
        let inputSources = inputMethod.inputSources(havingInputSourceID: "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman")
        
        if let inputSource = inputSources.first {

            XCTAssertEqual(inputSource.id, "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman")
            XCTAssertEqual(inputSource.localizedName, "英字")
            XCTAssertEqual(inputSource.category, "TISCategoryKeyboardInputSource")
            XCTAssertEqual(inputSource.type, "TISTypeKeyboardInputMode")
            XCTAssertEqual(inputSource.languages, ["en"])
            XCTAssertTrue(inputSource.isASCIICapable)
            XCTAssertTrue(inputSource.isSelectCapable)
            XCTAssertTrue(inputSource.isEnableCapable)
            XCTAssertTrue(inputSource.isEnabled)
        }
    }
    
    func testKotoeriKatakana() throws {
        
        let inputMethod = InputMethod()
        let inputSources = inputMethod.inputSources(havingInputSourceID: "com.apple.inputmethod.Kotoeri.RomajiTyping.Katakana")
        
        if let inputSource = inputSources.first {

            XCTAssertEqual(inputSource.id, "com.apple.inputmethod.Kotoeri.RomajiTyping.Katakana")
            XCTAssertEqual(inputSource.localizedName, "カタカナ")
            XCTAssertEqual(inputSource.category, "TISCategoryKeyboardInputSource")
            XCTAssertEqual(inputSource.type, "TISTypeKeyboardInputMode")
            XCTAssertEqual(inputSource.languages, [])
            XCTAssertTrue(inputSource.isASCIICapable)
            XCTAssertTrue(inputSource.isSelectCapable)
            XCTAssertTrue(inputSource.isEnableCapable)
            XCTAssertTrue(inputSource.isEnabled)
        }
    }

    func testKotoeriHalfWidthKana() throws {
        
        let inputMethod = InputMethod()
        let inputSources = inputMethod.inputSources(havingInputSourceID: "com.apple.inputmethod.Kotoeri.RomajiTyping.HalfWidthKana")
        
        if let inputSource = inputSources.first {

            XCTAssertEqual(inputSource.id, "com.apple.inputmethod.Kotoeri.RomajiTyping.HalfWidthKana")
            XCTAssertEqual(inputSource.localizedName, "半角カタカナ")
            XCTAssertEqual(inputSource.category, "TISCategoryKeyboardInputSource")
            XCTAssertEqual(inputSource.type, "TISTypeKeyboardInputMode")
            XCTAssertEqual(inputSource.languages, [])
            XCTAssertTrue(inputSource.isASCIICapable)
            XCTAssertTrue(inputSource.isSelectCapable)
            XCTAssertTrue(inputSource.isEnableCapable)
            XCTAssertTrue(inputSource.isEnabled)
        }
    }

    func testKotoeriFullWidthRoman() throws {
        
        let inputMethod = InputMethod()
        let inputSources = inputMethod.inputSources(havingInputSourceID: "com.apple.inputmethod.Kotoeri.RomajiTyping.FullWidthRoman")
        
        if let inputSource = inputSources.first {

            XCTAssertEqual(inputSource.id, "com.apple.inputmethod.Kotoeri.RomajiTyping.FullWidthRoman")
            XCTAssertEqual(inputSource.localizedName, "全角英数")
            XCTAssertEqual(inputSource.category, "TISCategoryKeyboardInputSource")
            XCTAssertEqual(inputSource.type, "TISTypeKeyboardInputMode")
            XCTAssertEqual(inputSource.languages, [])
            XCTAssertTrue(inputSource.isASCIICapable)
            XCTAssertTrue(inputSource.isSelectCapable)
            XCTAssertTrue(inputSource.isEnableCapable)
            XCTAssertTrue(inputSource.isEnabled)
        }
    }
    
    func testKotoeriJapanese() throws {
        
        let inputMethod = InputMethod()
        let inputSources = inputMethod.inputSources(havingInputSourceID: "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese")
        
        if let inputSource = inputSources.first {

            XCTAssertEqual(inputSource.id, "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese")
            XCTAssertEqual(inputSource.localizedName, "ひらがな")
            XCTAssertEqual(inputSource.category, "TISCategoryKeyboardInputSource")
            XCTAssertEqual(inputSource.type, "TISTypeKeyboardInputMode")
            XCTAssertEqual(inputSource.languages, ["ja"])
            XCTAssertFalse(inputSource.isASCIICapable)
            XCTAssertTrue(inputSource.isSelectCapable)
            XCTAssertTrue(inputSource.isEnableCapable)
            XCTAssertTrue(inputSource.isEnabled)
        }
    }

    func testInputSources() throws {
        
        let inputMethod = InputMethod()
        let inputSources = inputMethod.inputSources()
        let reservedInputSource = inputMethod.currentInputSource
        
        defer {
            
            inputMethod.select(inputSource: reservedInputSource)
        }
        
        XCTAssertTrue(inputSources.count > 0)
        
        for inputSource in inputSources where inputSource.isSelectCapable {
            
            print(inputSource)
            
            let currentInputSource = inputMethod.currentInputSource
            
            guard inputSource.category != "TISCategoryPaletteInputSource" else {
                
                continue
            }
            
            if inputSource.isSelected {
                
                XCTAssertEqual(inputSource.id, currentInputSource.id)
                XCTAssertEqual(inputSource.localizedName, currentInputSource.localizedName)
            }
            else {
                
                XCTAssertNotEqual(inputSource.id, currentInputSource.id)
                XCTAssertNotEqual(inputSource.localizedName, currentInputSource.localizedName)
                
                let selectionSucceeded = inputMethod.select(inputSource: inputSource)
                let currentInputSourceAfterSelection = inputMethod.currentInputSource

                if inputSource.isSelectCapable {

                    XCTAssertTrue(selectionSucceeded)

                    XCTAssertEqual(inputSource.id, currentInputSourceAfterSelection.id)
                    XCTAssertEqual(inputSource.localizedName, currentInputSourceAfterSelection.localizedName)
                }
                else {
                    
                    XCTAssertFalse(selectionSucceeded)

                    XCTAssertNotEqual(inputSource.id, currentInputSourceAfterSelection.id)
                    XCTAssertNotEqual(inputSource.localizedName, currentInputSourceAfterSelection.localizedName)
                }
            }
            
            Thread.sleep(forTimeInterval: 0.1)
        }
    }
}

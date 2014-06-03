//
//  NSKitUtilities.swift
//  NSKit
//
//  Created by Patrick Chamelo on 02/06/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import XCTest
import NSKit

class NSKitUtilities_test : XCTestCase
{
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }

    func testFlooredRect()
    {
        var previousRect = NSRect(x : 10.5, y : 5.5, width : 20.7, height : 30.2)
        var rect = NSKitUtilities.flooredRect(previousRect)

        XCTAssertTrue(rect.origin.x == floor(previousRect.origin.x), "Issue found with origin x");
        XCTAssertTrue(rect.origin.y == floor(previousRect.origin.y), "Issue found with origin y");
        XCTAssertTrue(rect.size.width == floor(previousRect.size.width), "Issue found with width");
        XCTAssertTrue(rect.size.height == floor(previousRect.size.height), "Issue found with height");
        XCTAssertTrue(rect.origin.x == 10, "Issue found with origin x");
        XCTAssertTrue(rect.origin.y == 5, "Issue found with origin y");
        XCTAssertTrue(rect.size.width == 20, "Issue found with width");
        XCTAssertTrue(rect.size.height == 30, "Issue found with height");
    }
    
    func testValidEmail()
    {
        var email1 = "patrick@nscoding.co.uk"
        var email2 = "patrick_@nscoding.co.uk"
        var email3 = "patrick @nscoding.co.uk"
        var email4 = "patrick@@nscoding.co.uk"
        var email5 = "_patrick_test@nscoding.co.uk"

        XCTAssertTrue(NSKitUtilities.isValidEmail(email1), "Email is valid but failed the test");
        XCTAssertTrue(NSKitUtilities.isValidEmail(email2), "Email is valid but failed the test");
        XCTAssertFalse(NSKitUtilities.isValidEmail(email3), "Email is not valid but passed the test");
        XCTAssertFalse(NSKitUtilities.isValidEmail(email4), "Email is not valid but passed the test");
        XCTAssertTrue(NSKitUtilities.isValidEmail(email5), "Email is valid but failed the test");
    }
}

//
//  NSColor_Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/29/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//  * http://hex.colorrrs.com data */

#import <XCTest/XCTest.h>
#import "NSColor+NSKitExtensions.h"


// ------------------------------------------------------------------------------------------


@interface NSColor_Test : XCTestCase @end


// ------------------------------------------------------------------------------------------


@implementation NSColor_Test


// ------------------------------------------------------------------------------------------
#pragma mark - Tests
// ------------------------------------------------------------------------------------------
- (void)testColorFromHexRGB
{
    NSColor *a1 = [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.0f alpha:1.0];
    NSColor *a2 = [NSColor colorFromHexRGB:@"000000"];
    XCTAssertTrue(a1.redComponent == a2.redComponent, @"Color should be the same");
    XCTAssertTrue(a1.greenComponent == a2.greenComponent, @"Color should be the same");
    XCTAssertTrue(a1.blueComponent == a2.blueComponent, @"Color should be the same");

    NSColor *a3 = [NSColor colorWithCalibratedRed:((float)163 / (float)255)
                                            green:((float)63 / (float)255)
                                             blue:((float)170 / (float)255) alpha:1.0];
    NSColor *a4 = [NSColor colorFromHexRGB:@"A33FAA"];
    XCTAssertTrue(a3.redComponent == a4.redComponent, @"Color should be the same");
    XCTAssertTrue(a3.greenComponent == a4.greenComponent, @"Color should be the same");
    XCTAssertTrue(a3.blueComponent == a4.blueComponent, @"Color should be the same");
    
    NSColor *a5 = [NSColor colorWithCalibratedRed:((float)63 / (float)255)
                                            green:((float)160 / (float)255)
                                             blue:((float)12 / (float)255) alpha:1.0];
    NSColor *a6 = [NSColor colorFromHexRGB:@"3FA00C"];
    XCTAssertTrue(a5.redComponent == a6.redComponent, @"Color should be the same");
    XCTAssertTrue(a5.greenComponent == a6.greenComponent, @"Color should be the same");
    XCTAssertTrue(a5.blueComponent == a6.blueComponent, @"Color should be the same");
}


- (void)testColorHexWithColor
{
    NSColor *color1 = [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.0f alpha:1.0];
    NSString *t1 = [NSColor hexCodeWithColor:color1];
    NSString *t2 = @"000000";
    XCTAssertTrue([t1 isEqualToString:t2], @"Color string should be the same");

    
    NSColor *color2 = [NSColor colorWithCalibratedRed:((float)163 / (float)255)
                                                green:((float)63 / (float)255)
                                                 blue:((float)170 / (float)255) alpha:1.0];
    NSString *t3 = [NSColor hexCodeWithColor:color2];
    NSString *t4 = @"A33FAA";
    XCTAssertTrue([t3 isEqualToString:t4], @"Color string  should be the same");
    
    
    NSColor *color3 = [NSColor colorWithCalibratedRed:((float)63 / (float)255)
                                                green:((float)160 / (float)255)
                                                 blue:((float)12 / (float)255) alpha:1.0];
    NSString *t5 = [NSColor hexCodeWithColor:color3];
    NSString *t6 = @"3FA00C";
    XCTAssertTrue([t5 isEqualToString:t6], @"Color string  should be the same");
}


- (void)testColorRGBwithColor
{
    NSColor *color1 = [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.0f alpha:1.0];
    NSString *t1 = [NSColor RGBWithColor:color1];
    NSString *t2 = @"0, 0, 0";
    XCTAssertTrue([t1 isEqualToString:t2], @"Color string should be the same");
    
    
    NSColor *color2 = [NSColor colorWithCalibratedRed:((float)163 / (float)255)
                                                green:((float)63 / (float)255)
                                                 blue:((float)170 / (float)255) alpha:1.0];
    NSString *t3 = [NSColor RGBWithColor:color2];
    NSString *t4 = @"163, 63, 170";

    XCTAssertTrue([t3 isEqualToString:t4], @"Color string  should be the same");
    
    
    NSColor *color3 = [NSColor colorWithCalibratedRed:((float)63 / (float)255)
                                                green:((float)160 / (float)255)
                                                 blue:((float)12 / (float)255) alpha:1.0];
    NSString *t5 = [NSColor RGBWithColor:color3];
    NSString *t6 = @"63, 160, 12";
    XCTAssertTrue([t5 isEqualToString:t6], @"Color string  should be the same");
}


- (void)testCGColor
{
    NSColor *testColor = [NSColor colorFromHexRGB:@"3FA00C"];

    NSColorSpace *colorSpace = [NSColorSpace genericRGBColorSpace];
    NSColor *color = [testColor colorUsingColorSpace:colorSpace];
    
    NSInteger count = [color numberOfComponents];
    CGFloat components[count];
    [color getComponents:components];
    
    CGColorSpaceRef colorSpaceRef = colorSpace.CGColorSpace;
    CGColorRef result = CGColorCreate(colorSpaceRef, components);
    
    CGColorSpaceModel a1 = CGColorSpaceGetModel(CGColorGetColorSpace(result));
    CGColorSpaceModel a2 = CGColorSpaceGetModel(CGColorGetColorSpace(testColor.CGColor));
                                                                                                
    XCTAssertTrue((a1 == a2), @"CGClor should be the same");
}


@end

//
//  NSKitMath.swift
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

import Foundation

@objc(NSKitMath)
class NSKitMath
{
    /**
    * Checks if the float has decimal points.
    *
    * @param value The value to check
    *
    * @return YES if the number has decimal points; otherwise, NO.
    *
    */
    class func hasDecimalPoints(value: Double) -> Bool
    {
        if (floor(value) != value)
        {
            return true
        }

        return false
    }
    
    
    /**
    * Generates a random number from a start to end.
    *
    * @param From Number, The starting value for the random generation
    * @param End Number, The ending value for the random generation
    *
    * @return NSInteger A random number between start and end.
    *
    * @warning *Important:* If the start value is higher than the end value, an exception is raised.
    *
    */
    class func generateRandomFromNumber(fromNumber: Int, toNumber: Int) -> Int
    {
        if (fromNumber > toNumber)
        {
            NSException(name: "Invalid input",
                        reason: "ERROR: The start value is higher than the end value.",
                        userInfo: nil).raise()
        }

        var diff = abs(fromNumber - toNumber)
        if (diff == 0)
        {
            return fromNumber
        }

        var value = arc4random_uniform(UInt32(diff))
        
        return (fromNumber + Int(value))
    }

}
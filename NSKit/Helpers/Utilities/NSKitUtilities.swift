//
//  NSKitUtilities.swift
//  NSKit
//
//  Created by Patrick Chamelo on 02/06/14.
//  Copyright (c) 2014 Patrick Chamelo. All rights reserved.
//

import Foundation

@objc(NSKitUtilities)
class NSKitUtilities
{
    /**
    * Receives a rect and floors, x, y, width and height.
    *
    * @param rect The NSRect to floor
    *
    * @return NSRect the floored rect.
    *
    */
    @objc(flooredRect:)
    class func flooredRect(rect: NSRect) -> NSRect
    {
        var flooredRectOrigin = NSKitUtilities.flooredOriginRect(rect);
        return NSRect(x : flooredRectOrigin.origin.x, y : flooredRectOrigin.origin.y, width : floor(rect.size.width), height : floor(rect.size.height))
    }
    
    /**
    * Receives a rect and ceils, x, y, width and height.
    *
    * @param rect The NSRect to ceil.
    *
    * @return NSRect the ceiled rect.
    *
    */
    @objc(ceiledRect:)
    class func ceiledRect(rect: NSRect) -> NSRect
    {
        var ceiledRectOrigin = NSKitUtilities.ceiledOriginRect(rect);
        return NSRect(x : ceiledRectOrigin.origin.x, y : ceiledRectOrigin.origin.y, width : ceil(rect.size.width), height : ceil(rect.size.height))
    }
    
    /**
    * Receives a rect and floors the origin of the rect, (x and y)
    *
    * @param rect The NSRect to floor the origin.
    *
    * @return NSRect the floored origin rect.
    *
    */
    @objc(flooredOriginRect:)
    class func flooredOriginRect(rect: NSRect) -> NSRect
    {
        return NSRect(x : floor(rect.origin.x), y : floor(rect.origin.y), width : rect.size.width, height : rect.size.height)
    }

    
    /**
    * Receives a rect and ceils the origin of the rect, (x and y)
    *
    * @param rect The NSRect to floor the origin.
    *
    * @return NSRect the floored origin rect.
    *
    */
    @objc(ceiledOriginRect:)
    class func ceiledOriginRect(rect: NSRect) -> NSRect
    {
        return NSRect(x : ceil(rect.origin.x), y : ceil(rect.origin.y), width : rect.size.width, height : rect.size.height)
    }

    
    /**
    * The methood returns true if the given string contains a valid e-mail
    * address and false if it does not, but takes no other action.
    *
    * @param email The Email of the user
    *
    * @return YES if the email is valid; otherwise, NO.
    *
    */
    @objc(isValidEmail:)
    class func isValidEmail(email: NSString) -> Bool
    {
        return false

        /**
            // FIXME: This is not working as expected.
            var trimmedEmail = email.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            
            var regex = "^[A-Za-z0-9._%%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
            var regexEmail = NSPredicate(format: regex, argumentArray: nil)
            
            return regexEmail.evaluateWithObject(trimmedEmail)
        */
    }
}

//
//  NSKitKeyboardHelper.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/24/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//

#import "NSKitKeyboardHelper.h"

static unsigned short kReturnKey = 36;
static unsigned short kReturnNumBlockKey = 76;
static unsigned short kTabKey = 48;
static unsigned short kEspaceKey = 53;
static unsigned short kLeftArrowKey = 123;
static unsigned short kRightArrowKey = 124;
static unsigned short kUpArrowKey = 126;
static unsigned short kDownArrowKey = 125;


@implementation NSKitKeyboardHelper

+ (BOOL)returnKeyIsPressedForEvent:(NSEvent *)event
{
    if (event != nil && [event respondsToSelector:@selector(keyCode)] &&
        (event.type == NSKeyDown || event.type == NSKeyUp))
    {
        unsigned short keyModified = [[event charactersIgnoringModifiers] characterAtIndex:0];
        unsigned short keyEventCode = [event keyCode];
        
        if (keyModified == NSNewlineCharacter ||
            keyModified == NSEnterCharacter ||
            keyModified  == NSInsertLineFunctionKey ||
            keyEventCode == kReturnKey ||
            keyEventCode == kReturnNumBlockKey)
        {
            return YES;
        }
    }
    return NO;
}


+ (BOOL)tabKeyIsPressedForEvent:(NSEvent *)event
{
    if (event != nil && [event respondsToSelector:@selector(keyCode)] &&
        (event.type == NSKeyDown || event.type == NSKeyUp))
    {
        unsigned short keyModified = [[event charactersIgnoringModifiers] characterAtIndex:0];
        unsigned short keyEventCode = [event keyCode];
        
        if (keyModified == NSTabCharacter ||
            keyEventCode == kTabKey)
        {
            return YES;
        }
    }
    
    return NO;
}


+ (BOOL)shiftKeyIsPressedForEvent:(NSEvent *)event
{
    BOOL isShiftKeyPressed = NO;
    
    if (event != nil &&
        [event respondsToSelector:@selector(modifierFlags)] &&
        (event.type == NSKeyDown || event.type == NSKeyUp))
    {
        isShiftKeyPressed = ([event modifierFlags] & NSShiftKeyMask) != 0;
    }
    
    return isShiftKeyPressed;
}


+ (BOOL)escapeKeyIsPressedForEvent:(NSEvent *)event
{
    BOOL isEscapeKeyPressed = NO;
    
    if (event != nil && [event respondsToSelector:@selector(keyCode)] &&
        (event.type == NSKeyDown || event.type == NSKeyUp))
    {
        unsigned short keyEventCode = [event keyCode];
        
        if (keyEventCode == kEspaceKey)
        {
            return YES;
        }
    }
    
    return isEscapeKeyPressed;
}


+ (BOOL)leftKeyIsPressedForEvent:(NSEvent *)event
{
    BOOL leftKeyPressed = NO;
    
    if (event != nil && [event respondsToSelector:@selector(keyCode)] &&
        (event.type == NSKeyDown || event.type == NSKeyUp))
    {
        unsigned short keyModified = [[event charactersIgnoringModifiers] characterAtIndex:0];
        unsigned short keyEventCode = [event keyCode];
        
        if (keyModified == NSLeftArrowFunctionKey ||
            keyEventCode == kLeftArrowKey)
        {
            return YES;
        }
    }
    
    return leftKeyPressed;
}


+ (BOOL)rightKeyIsPressedForEvent:(NSEvent *)event
{
    BOOL rightKeyPressed = NO;
    
    if (event != nil && [event respondsToSelector:@selector(keyCode)] &&
        (event.type == NSKeyDown || event.type == NSKeyUp))
    {
        unsigned short keyModified = [[event charactersIgnoringModifiers] characterAtIndex:0];
        unsigned short keyEventCode = [event keyCode];
        
        if (keyModified == NSRightArrowFunctionKey ||
            keyEventCode == kRightArrowKey)
        {
            return YES;
        }
    }
    
    return rightKeyPressed;
}


+ (BOOL)upKeyIsPressedForEvent:(NSEvent *)event
{
    BOOL upKeyPressed = NO;
    
    if (event != nil && [event respondsToSelector:@selector(keyCode)] &&
        (event.type == NSKeyDown || event.type == NSKeyUp))
    {
        unsigned short keyModified = [[event charactersIgnoringModifiers] characterAtIndex:0];
        unsigned short keyEventCode = [event keyCode];
        
        if (keyModified == NSUpArrowFunctionKey ||
            keyEventCode == kUpArrowKey)
        {
            return YES;
        }
    }
    
    return upKeyPressed;
}


+ (BOOL)downKeyIsPressedForEvent:(NSEvent *)event
{
    BOOL downKeyPressed = NO;
    
    if (event != nil && [event respondsToSelector:@selector(keyCode)] &&
        (event.type == NSKeyDown || event.type == NSKeyUp))
    {
        unsigned short keyModified = [[event charactersIgnoringModifiers] characterAtIndex:0];
        unsigned short keyEventCode = [event keyCode];
        
        if (keyModified == NSDownArrowFunctionKey ||
            keyEventCode == kDownArrowKey)
        {
            return YES;
        }
    }
    
    return downKeyPressed;
}


+ (BOOL)controlKeyIsPressedForEvent:(NSEvent *)event
{
    if ([event modifierFlags] & NSControlKeyMask)
    {
        return YES;
    }
    
    return NO;
}


@end

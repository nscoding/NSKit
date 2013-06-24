//
//  NSKitKeyboardHelper.h
//  NSKit
//
//  Created by Patrick Chamelo on 6/24/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//


@interface NSKitKeyboardHelper : NSObject

+ (BOOL)returnKeyIsPressedForEvent:(NSEvent *)event;
+ (BOOL)tabKeyIsPressedForEvent:(NSEvent *)event;
+ (BOOL)shiftKeyIsPressedForEvent:(NSEvent *)event;
+ (BOOL)escapeKeyIsPressedForEvent:(NSEvent *)event;
+ (BOOL)leftKeyIsPressedForEvent:(NSEvent *)event;
+ (BOOL)rightKeyIsPressedForEvent:(NSEvent *)event;
+ (BOOL)upKeyIsPressedForEvent:(NSEvent *)event;
+ (BOOL)downKeyIsPressedForEvent:(NSEvent *)event;
+ (BOOL)controlKeyIsPressedForEvent:(NSEvent *)event;

@end

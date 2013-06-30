//
//  NSKit.h
//  NSKit
//
//  Created by Patrick Chamelo on 6/23/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
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


extern BOOL SystemAtLeastLion;
extern BOOL SystemAtLeastLionWithRetina;
extern BOOL SystemAtLeastMountainLion;
extern BOOL SystemAtLeastMaverics; // set at launch

#import "NSKitLinkedListProtocol.h"
#import "NSKitSinglyLinkedList.h"
#import "NSKitQueue.h"
#import "NSKitStack.h"
#import "NSKitPerformanceTimer.h"
#import "NSKitMemoryHelper.h"
#import "NSKitEmailHelper.h"
#import "NSKitUtilities.h"
#import "NSKitKeyboardHelper.h"
#import "NSArray+NSKitExtensions.h"
#import "NSMutableArray+NSKitExtensions.h"
#import "NSMutableAttributedString+NSKitExtensions.h"
#import "NSTextStorage+NSKitExtensions.h"
#import "NSView+NSKitExtensions.h"
#import "NSWindow+NSKitExtensions.h"
#import "NSColor+NSKitExtensions.h"
#import "NSImage+NSKitExtensions.h"
#import "NSUserDefaults+NSKitExtensions.h"
#import "NSKitSoundProxy.h"
#import "NSKitInternetDoctor.h"
#import "NSKitMath.h"
#import "NSKitHeapPriorityQueue.h"
#import "NSKitMutableArray.h"
#import "NSKitCGContextHelper.h"

@interface NSKit : NSObject

@end

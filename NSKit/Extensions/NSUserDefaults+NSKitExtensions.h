//
//  NSUserDefaults+NSKitExtensions.h
//  NSKit
//
//  Created by Patrick Chamelo on 6/24/13.
//  Copyright (c) 2015 Patrick Chamelo. All rights reserved.
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

/** Extends the NSUserDefaults with helper methods */
@interface NSUserDefaults (NSKitExtensions)

/**
 * Sets the value of the specified key, relative to the receiver, to the provided value,
 * additionally will syncronize the defaults.
 *
 * @param value The value to be stored in defaults for the given key, if the
 * key is emplty the it removed the object for the given key.
 *
 * @param key The name of the key.
 *
 */
+ (void)nskit_setValue:(id)value forKey:(NSString *)key;

/**
 *
 * @param key The key name to retrieve the object.
 *
 * @return id The object for a give key.
 */
+ (id)nskit_valueForKey:(NSString *)key;

@end

//
//  NSKitSinglyLinkedList+Private.h
//  NSKit
//
//  Created by Patrick Chamelo on 7/6/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//


#import "NSKitLinkedListProtocol.h"


@interface NSKitSinglyLinkedList (Private)

- (void)previousObject:(NSObject<NSKitLinkedListProtocol> **)prevObject
         currentObject:(NSObject<NSKitLinkedListProtocol> **)currentObject
               atIndex:(NSInteger)index;

@end

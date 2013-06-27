//
//  NSKitLinkedListProtocol.h
//  NSKit
//
//  Created by Patrick Chamelo on 6/28/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//


@protocol NSKitLinkedListProtocol;

/** Linked list protocol, object that will be added in the linked lists must conform to this protocol. */
@protocol NSKitLinkedListProtocol <NSObject>

@required
/** link to the next node, used in NSKitSinglyLinkedList */
@property (nonatomic, strong) NSObject<NSKitLinkedListProtocol> *nextLink;

@optional
/** link to the previous node, used in Double linked list */
@property (nonatomic, strong) NSObject<NSKitLinkedListProtocol> *previousLink;

@end


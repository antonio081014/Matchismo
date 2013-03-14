//
//  Deck.h
//  Machismo
//
//  Created by Dev Perfecular on 3/14/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end

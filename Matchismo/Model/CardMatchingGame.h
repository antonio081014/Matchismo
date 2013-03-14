//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Dev Perfecular on 3/14/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (readonly, nonatomic) int score;

- (id)initWithCardCount:(int)cardCount usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@end

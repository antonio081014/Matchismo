//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Dev Perfecular on 3/14/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards; // of cards;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (id)initWithCardCount:(int)cardCount usingDeck:(Deck *)deck {
    
    self = [super init];
    
    if (self) {
        for (int i=0; i<cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                self.cards[i] = card;
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

#define MISMATCH_PENALTY -2
#define MATCH_BONUS 4
#define FLIP_COST -1;

- (void)flipCardAtIndex:(NSUInteger)index {
    Card * card = [self cardAtIndex:index];
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards) {
                if (!otherCard.isUnplayable && otherCard.isFaceUp) {
                    int matchScore = [otherCard match:@[card]];
                    if (matchScore > 0) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        otherCard.faceUp = NO;
                        self.score += MISMATCH_PENALTY;
                    }
                }
            }
            self.score += FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end

//
//  PlayingCard.m
//  Matchismo
//
//  Created by Antonio081014 on 3/14/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (NSString *)suit {
    return _suit ? _suit : @"?";
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (int)match:(NSArray *)otherCards {
    int score = 0;
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if (self.rank == otherCard.rank) {
            score = 4;
        } else if ([self.suit isEqualToString:otherCard.suit]) {
            score = 1;
        }
    }
    return score;
}

+ (NSArray *) rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSArray *) validSuits {
    return @[@"♠",@"♣",@"♥",@"♦"];
}

+ (NSUInteger) maxRank {
    return [[PlayingCard rankStrings] count] - 1;
}

- (NSString *)description {
    return self.contents;
}

- (NSString *)contents {
    return [NSString stringWithFormat:@"%@%@", [PlayingCard rankStrings][self.rank], self.suit];
}

@end

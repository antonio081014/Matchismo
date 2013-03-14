//
//  Card.m
//  Machismo
//
//  Created by Dev Perfecular on 3/14/13.
//  Copyright (c) 2013 Antonio081014.com. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards {
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            return 1;
        }
    }
    return 0;
}

@end

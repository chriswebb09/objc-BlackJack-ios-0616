//
//  FISCardDeck.m
//  BlackJack
//
//  Created by Christopher Webb-Orenstein on 6/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISCardDeck.h"

@implementation FISCardDeck


-(instancetype)init {
    self = [super init];
    if (self) {
        _remainingCards = [[NSMutableArray alloc]init];
        _dealtCards = [[NSMutableArray alloc]init];
        [self generateCards];
        [self shuffleRemainingCards];
    }
    return self;
}

-(void)generateCards {
    for (NSString *suit in [FISCard validSuits]) {
        for (NSString *rank in [FISCard validRanks]) {
            FISCard *newCard = [[FISCard alloc] initWithSuit:suit rank:rank];
            [self.remainingCards addObject:newCard];
        }
    }
}

-(FISCard *)drawNextCard {
    if (self.remainingCards.count == 0 ) {
        return nil;
    }
    FISCard *card = [self.remainingCards lastObject];
    [self.dealtCards addObject:card];
    [self.remainingCards removeLastObject];
    return card;
}

-(void)gatherDealtCards {
    [self.remainingCards addObjectsFromArray:self.dealtCards];
    [self.dealtCards removeAllObjects];
}

-(void)resetDeck {
    [self generateCards];
    [self.dealtCards removeAllObjects];
    [self shuffleRemainingCards];
}

-(void)shuffleRemainingCards {
    NSMutableArray *cardsToShuffle= [self.remainingCards mutableCopy];
    [self.remainingCards removeAllObjects];
    NSUInteger randomCard = 0;
    while (cardsToShuffle.count > 0) {
        randomCard = arc4random_uniform((uint32_t)cardsToShuffle.count);
        [self.remainingCards addObject:cardsToShuffle[randomCard]];
        [cardsToShuffle removeObjectAtIndex:randomCard];
    }
}


-(NSString *)description {
    NSMutableString *cardsLeft = [[NSMutableString alloc]init];
    for (FISCard *card in self.remainingCards) {
        [cardsLeft appendFormat:@" %@", card.description];
    }
    NSString *deckDescription = [NSString stringWithFormat:@"count: %lu \ncards: %@", self.remainingCards.count, cardsLeft];
    return deckDescription;
}


@end

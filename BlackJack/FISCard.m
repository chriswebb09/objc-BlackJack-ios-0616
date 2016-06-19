//
//  FISCard.m
//  BlackJack
//
//  Created by Christopher Webb-Orenstein on 6/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISCard.h"

@interface FISCard ()

@property (strong, nonatomic, readwrite) NSString *suit;
@property (strong, nonatomic, readwrite) NSString *rank;
@property (strong, nonatomic, readwrite) NSString *cardLabel;
@property (nonatomic, readwrite) NSUInteger cardValue;

@end

@implementation FISCard

-(instancetype)init {
    return [self initWithSuit:@"!" rank:@"N"];
}

-(instancetype)initWithSuit:(NSString *)suit rank:(NSString *)rank {
    self = [super init];
    
    if (self) {
        _suit = suit;
        _rank = rank;
        _cardLabel = [_suit stringByAppendingString:_rank];
        _cardValue = [[self class] getCardValue:_rank];
        
    }
    return self;
}

+ (NSArray *)validSuits {
    return @[@"♠", @"♥", @"♣", @"♦"];
}

+ (NSArray *)validRanks {
    
    return @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)getCardValue:(NSString *)cardRank {
    NSArray *ranksArray = [self validRanks];
    NSUInteger value = 0;
    NSArray *faceCards = @[@"J", @"Q", @"K"];
    
    if ([cardRank isEqualToString:@"A"]) {
        value = 1;
    } else if ([faceCards containsObject:cardRank]) {
        value = 10;
    } else {
        value = [ranksArray indexOfObject:cardRank] + 1;
    }
    return value;
}

- (NSString *)description {
    return self.cardLabel;
}



@end

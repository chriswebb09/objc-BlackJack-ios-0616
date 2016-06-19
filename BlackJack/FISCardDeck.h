//
//  FISCardDeck.h
//  BlackJack
//
//  Created by Christopher Webb-Orenstein on 6/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"
@interface FISCardDeck : NSObject

@property (strong, nonatomic) NSMutableArray *dealtCards;
@property (strong, nonatomic) NSMutableArray *remainingCards;

-(instancetype)init;

-(FISCard *)drawNextCard;

-(void)resetDeck;

-(void)gatherDealtCards;

-(void)shuffleRemainingCards;

-(NSString *)description;

@end

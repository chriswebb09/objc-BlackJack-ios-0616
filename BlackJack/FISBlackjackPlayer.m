//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Christopher Webb-Orenstein on 6/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer

-(instancetype)init {
    return [self initWithName:@""];
}

-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

-(void)resetForNewGame {
    
}
-(void)acceptCard:(FISCard *)card {
}

-(BOOL)shouldHit {
    return NO;
}

@end

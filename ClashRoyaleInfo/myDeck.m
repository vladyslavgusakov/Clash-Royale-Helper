//
//  myDeck.m
//  ClashRoyaleInfo
//
//  Created by Vladyslav Gusakov on 3/15/16.
//  Copyright © 2016 Vladyslav Gusakov. All rights reserved.
//

#import "myDeck.h"

@implementation myDeck

-(instancetype) init {
    self = [super init];
    
    if (self) {

        self.backgroundColor = [UIColor brownColor];
        self.layer.borderColor = [[UIColor blackColor] CGColor];
        self.layer.borderWidth = 2.5;
        self.layer.cornerRadius = 5.0;
        
        self.width = 768*0.66;//width*0.66;
        self.height = 1024*0.3;//height*0.30;
        self.interval = 0;
        
        self.card1 = [[myCard alloc] initWithPosX:25 andPosY:5];
        [self addSubview:self.card1.button];
        
        self.card2 = [[myCard alloc] initWithPosX:self.interval + self.card1.width + self.card1.x andPosY:5];
        [self addSubview:self.card2.button];
        
        self.card3 = [[myCard alloc] initWithPosX:self.interval + self.card2.width + self.card2.x andPosY:5];
        [self addSubview:self.card3.button];
        
        self.card4 = [[myCard alloc] initWithPosX:self.interval + self.card3.width + self.card3.x andPosY:5];
        [self addSubview:self.card4.button];
        
        self.card5 = [[myCard alloc] initWithPosX:25 andPosY:self.card1.height + self.interval];
        [self addSubview:self.card5.button];
        
        self.card6 = [[myCard alloc] initWithPosX:self.interval + self.card5.width + self.card5.x andPosY:self.card1.height + self.interval];
        [self addSubview:self.card6.button];
        
        self.card7 = [[myCard alloc] initWithPosX:self.interval + self.card6.width + self.card6.x andPosY:self.card1.height + self.interval];
        [self addSubview:self.card7.button];
        
        self.card8 = [[myCard alloc] initWithPosX:self.interval + self.card7.width + self.card7.x andPosY:self.card1.height + self.interval];
        
        [self addSubview:self.card8.button];
        
        self.averageElixirCost = [[UILabel alloc] initWithFrame:CGRectMake(self.card1.x, self.card5.y+self.card5.height, self.card1.width*4, self.height/10)];
        self.averageElixirCost.textAlignment = NSTextAlignmentCenter;
        self.averageElixirCost.backgroundColor = [UIColor colorWithRed: 0.437 green: 0.31 blue: 0.067 alpha: 1];
        self.averageElixirCost.layer.cornerRadius = 7.0;
        self.averageElixirCost.layer.borderWidth = 2.0;
        self.averageElixirCost.layer.borderColor = [[UIColor blackColor] CGColor];
        self.averageElixirCost.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:20];
        self.averageElixirCost.textColor = [UIColor whiteColor];
        self.averageElixirCost.shadowOffset=CGSizeMake(1, 2);
        self.averageElixirCost.shadowColor=[UIColor blackColor];
        
        [self addSubview:self.averageElixirCost];
        
    }
    
    return self;
}

-(instancetype) initAtIndex: (NSUInteger) index {
    self = [self init];
    
    if (self) {
        self.deckNumber = [[UILabel alloc] initWithFrame:CGRectMake(5, 4, self.card1.width*3, 15)];
        self.deckNumber.text = [NSString stringWithFormat:@"Battle Deck #%lu",index+1];
        self.deckNumber.textColor = [UIColor whiteColor];
        self.deckNumber.font = [UIFont fontWithName:@"Menlo-Bold" size:18];
        self.deckNumber.shadowOffset=CGSizeMake(1, 2);
        self.deckNumber.shadowColor=[UIColor blackColor];
        [self addSubview:self.deckNumber];
    }
    
    return self;
}

@end

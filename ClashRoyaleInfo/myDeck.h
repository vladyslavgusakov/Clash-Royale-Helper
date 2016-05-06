//
//  myDeck.h
//  ClashRoyaleInfo
//
//  Created by Vladyslav Gusakov on 3/15/16.
//  Copyright © 2016 Vladyslav Gusakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "myCard.h"

@interface myDeck : UIView

@property (nonatomic) NSUInteger id;

@property (nonatomic) double x;
@property (nonatomic) double y;

@property (nonatomic) double width;
@property (nonatomic) double height;

@property (nonatomic, strong) myCard *card1;
@property (nonatomic, strong) myCard *card2;
@property (nonatomic, strong) myCard *card3;
@property (nonatomic, strong) myCard *card4;
@property (nonatomic, strong) myCard *card5;
@property (nonatomic, strong) myCard *card6;
@property (nonatomic, strong) myCard *card7;
@property (nonatomic, strong) myCard *card8;

@property (nonatomic) double interval;

@property (nonatomic, strong) UILabel *deckNumber;
@property (nonatomic, strong) UILabel *averageElixirCost;

-(instancetype) initAtIndex: (NSUInteger) index;
@end

//
//  myCard.m
//  ClashRoyaleInfo
//
//  Created by Vladyslav Gusakov on 3/15/16.
//  Copyright © 2016 Vladyslav Gusakov. All rights reserved.
// 283 * 340

#import "myCard.h"

@implementation myCard

-(instancetype) initWithPosX: (CGFloat) x andPosY: (CGFloat) y {
    self = [super init];
    
    if (self) {
        self.width = 113.2;
        self.height = 136;
        self.x = x;
        self.y = y;
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(self.x, self.y, self.width, self.height)];

    }
    
    return self;
}

@end
